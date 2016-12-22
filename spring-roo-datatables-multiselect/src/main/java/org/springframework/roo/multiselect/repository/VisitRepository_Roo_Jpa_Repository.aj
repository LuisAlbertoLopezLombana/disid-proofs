// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.repository;

import java.util.Date;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.roo.multiselect.domain.Pet;
import org.springframework.roo.multiselect.domain.Vet;
import org.springframework.roo.multiselect.domain.Visit;
import org.springframework.roo.multiselect.repository.VisitRepository;
import org.springframework.roo.multiselect.repository.VisitRepositoryCustom;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VisitRepository_Roo_Jpa_Repository {
    
    declare parents: VisitRepository extends JpaRepository<Visit, Long>;
    
    declare parents: VisitRepository extends VisitRepositoryCustom;
    
    declare @type: VisitRepository: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @return Long
     */
    public abstract long VisitRepository.countByVet(Vet vet);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @return Long
     */
    public abstract long VisitRepository.countByPet(Pet pet);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param visitDate
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepository.findByDescriptionAndVisitDate(String description, Date visitDate, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param visitDate
     * @return Long
     */
    public abstract long VisitRepository.countByDescriptionAndVisitDate(String description, Date visitDate);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visitDate1
     * @param visitDate2
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepository.findByVisitDateBetween(Date visitDate1, Date visitDate2, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visitDate1
     * @param visitDate2
     * @return Long
     */
    public abstract long VisitRepository.countByVisitDateBetween(Date visitDate1, Date visitDate2);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param pageable
     * @return Page
     */
    public abstract Page<Visit> VisitRepository.findByDescriptionLike(String description, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @return Long
     */
    public abstract long VisitRepository.countByDescriptionLike(String description);
    
}
