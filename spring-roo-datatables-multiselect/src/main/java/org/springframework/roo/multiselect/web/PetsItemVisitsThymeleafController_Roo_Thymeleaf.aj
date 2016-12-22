// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.web;

import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.web.datatables.Datatables;
import io.springlets.data.web.datatables.DatatablesData;
import io.springlets.data.web.datatables.DatatablesPageable;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.multiselect.domain.Pet;
import org.springframework.roo.multiselect.domain.Visit;
import org.springframework.roo.multiselect.service.api.PetService;
import org.springframework.roo.multiselect.service.api.VisitService;
import org.springframework.roo.multiselect.web.PetsCollectionThymeleafController;
import org.springframework.roo.multiselect.web.PetsItemVisitsThymeleafController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

privileged aspect PetsItemVisitsThymeleafController_Roo_Thymeleaf {
    
    declare @type: PetsItemVisitsThymeleafController: @Controller;
    
    declare @type: PetsItemVisitsThymeleafController: @RequestMapping(value = "/pets/{pet}/visits", name = "PetsItemVisitsThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public MessageSource PetsItemVisitsThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private MethodLinkBuilderFactory<PetsCollectionThymeleafController> PetsItemVisitsThymeleafController.collectionLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param petService
     * @param visitService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public PetsItemVisitsThymeleafController.new(PetService petService, VisitService visitService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        this.petService = petService;
        this.visitService = visitService;
        this.messageSource = messageSource;
        this.collectionLink = linkBuilder.of(PetsCollectionThymeleafController.class);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Pet
     */
    @ModelAttribute
    public Pet PetsItemVisitsThymeleafController.getPet(@PathVariable("pet") Long id) {
        Pet pet = petService.findOne(id);
        if (pet == null) {
            throw new NotFoundException(String.format("Pet with identifier '%s' not found",id));
        }
        return pet;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PetsItemVisitsThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("visitDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PetsItemVisitsThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param search
     * @param pageable
     * @param draw
     * @return ResponseEntity
     */
    @GetMapping(name = "datatables", produces = Datatables.MEDIA_TYPE, value = "/dt")
    @ResponseBody
    public ResponseEntity<DatatablesData<Visit>> PetsItemVisitsThymeleafController.datatables(@ModelAttribute Pet pet, GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        
        Page<Visit> visits = visitService.findByPet(pet, search, pageable);
        long totalVisitsCount = visitService.countByPet(pet);
        DatatablesData<Visit> data =  new DatatablesData<Visit>(visits, totalVisitsCount, draw);
        return ResponseEntity.ok(data);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param Pet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/create-form", name = "createForm")
    public ModelAndView PetsItemVisitsThymeleafController.createForm(@ModelAttribute Pet Pet, Model model) {
        populateForm(model);
        
        model.addAttribute(new Visit());
        return new ModelAndView("pets/visits/create");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param visitsToRemove
     * @return ResponseEntity
     */
    @DeleteMapping(name = "removeFromVisits", value = "/{visitsToRemove}")
    @ResponseBody
    public ResponseEntity<?> PetsItemVisitsThymeleafController.removeFromVisits(@ModelAttribute Pet pet, @PathVariable("visitsToRemove") Long visitsToRemove) {
        petService.removeFromVisits(pet,Collections.singleton(visitsToRemove));
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param visits
     * @param model
     * @return ModelAndView
     */
    @PostMapping(name = "create")
    public ModelAndView PetsItemVisitsThymeleafController.create(@ModelAttribute Pet pet, @RequestParam("visitsIds") List<Long> visits, Model model) {
        // Remove empty values
        for (Iterator<Long> iterator = visits.iterator(); iterator.hasNext();) {
            if (iterator.next() == null) {
                iterator.remove();
            }
        }
        petService.setVisits(pet,visits);
        return new ModelAndView("redirect:" + collectionLink.to("list").toUriString());
    }
    
}
