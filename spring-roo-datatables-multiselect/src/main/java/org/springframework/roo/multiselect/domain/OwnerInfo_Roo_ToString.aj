// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.domain;

import org.springframework.roo.multiselect.domain.OwnerInfo;

privileged aspect OwnerInfo_Roo_ToString {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String OwnerInfo.toString() {
        return "OwnerInfo {" + 
                "firstName='" + firstName + '\'' + 
                ", lastName='" + lastName + '\'' + 
                ", city='" + city + '\'' + 
                ", id='" + id + '\'' + "}" + super.toString();
    }
    
}
