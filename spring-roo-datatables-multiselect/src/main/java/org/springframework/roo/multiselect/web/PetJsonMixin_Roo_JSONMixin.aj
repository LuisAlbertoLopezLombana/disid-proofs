// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import java.util.Set;
import org.springframework.roo.multiselect.domain.Owner;
import org.springframework.roo.multiselect.domain.Visit;
import org.springframework.roo.multiselect.web.OwnerDeserializer;
import org.springframework.roo.multiselect.web.PetJsonMixin;

privileged aspect PetJsonMixin_Roo_JSONMixin {
    
    /**
     * TODO Auto-generated attribute documentation
     */
    @JsonIgnore
    private Set<Visit> PetJsonMixin.visits;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    @JsonDeserialize(using = OwnerDeserializer.class)
    private Owner PetJsonMixin.owner;
    
}
