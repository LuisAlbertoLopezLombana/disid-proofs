// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.repository;

import io.springlets.data.domain.GlobalSearch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.multiselect.domain.Owner;
import org.springframework.roo.multiselect.domain.OwnerCityFormBean;
import org.springframework.roo.multiselect.domain.OwnerFirstNameFormBean;
import org.springframework.roo.multiselect.domain.OwnerInfo;
import org.springframework.roo.multiselect.repository.OwnerRepositoryCustom;

privileged aspect OwnerRepositoryCustom_Roo_Jpa_Repository_Custom {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Owner> OwnerRepositoryCustom.findAll(GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Owner> OwnerRepositoryCustom.findByFirstNameLike(OwnerFirstNameFormBean formBean, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public abstract long OwnerRepositoryCustom.countByFirstNameLike(OwnerFirstNameFormBean formBean);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<OwnerInfo> OwnerRepositoryCustom.findByCityLike(OwnerCityFormBean formBean, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public abstract long OwnerRepositoryCustom.countByCityLike(OwnerCityFormBean formBean);
    
}
