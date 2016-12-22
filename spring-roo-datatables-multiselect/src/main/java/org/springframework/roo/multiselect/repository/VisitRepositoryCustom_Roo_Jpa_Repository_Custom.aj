// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.repository;

import io.springlets.data.domain.GlobalSearch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.multiselect.domain.Pet;
import org.springframework.roo.multiselect.domain.Vet;
import org.springframework.roo.multiselect.domain.Visit;
import org.springframework.roo.multiselect.repository.VisitRepositoryCustom;

privileged aspect VisitRepositoryCustom_Roo_Jpa_Repository_Custom {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepositoryCustom.findByVet(Vet vet, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepositoryCustom.findByPet(Pet pet, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepositoryCustom.findAll(GlobalSearch globalSearch, Pageable pageable);
    
}
