// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.web;

import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Arrays;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.multiselect.domain.Vet;
import org.springframework.roo.multiselect.reference.Specialty;
import org.springframework.roo.multiselect.service.api.VetService;
import org.springframework.roo.multiselect.web.VetsItemThymeleafController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect VetsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: VetsItemThymeleafController: @Controller;
    
    declare @type: VetsItemThymeleafController: @RequestMapping(value = "/vets/{vet}", name = "VetsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public MessageSource VetsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private MethodLinkBuilderFactory<VetsItemThymeleafController> VetsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param vetService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public VetsItemThymeleafController.new(VetService vetService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        this.vetService = vetService;
        this.messageSource = messageSource;
        this.itemLink = linkBuilder.of(VetsItemThymeleafController.class);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Vet
     */
    @ModelAttribute
    public Vet VetsItemThymeleafController.getVet(@PathVariable("vet") Long id) {
        Vet vet = vetService.findOne(id);
        if (vet == null) {
            throw new NotFoundException(String.format("Vet with identifier '%s' not found",id));
        }
        return vet;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView VetsItemThymeleafController.show(@ModelAttribute Vet vet, Model model) {
        return new ModelAndView("vets/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("vet")
    public void VetsItemThymeleafController.initVetBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VetsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("birthDay_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("employedSince_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VetsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
        model.addAttribute("specialty", Arrays.asList(Specialty.values()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView VetsItemThymeleafController.editForm(@ModelAttribute Vet vet, Model model) {
        populateForm(model);
        
        return new ModelAndView("vets/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView VetsItemThymeleafController.update(@Valid @ModelAttribute Vet vet, BindingResult result, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("vets/edit");
        }
        Vet savedVet = vetService.save(vet);
        UriComponents showURI = itemLink.to("show").with("vet", savedVet.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> VetsItemThymeleafController.delete(@ModelAttribute Vet vet) {
        vetService.delete(vet);
        return ResponseEntity.ok().build();
    }
    
}
