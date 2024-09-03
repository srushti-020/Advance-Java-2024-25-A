/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import javax.ejb.Stateless;

/**
 *
 * @author Admin
 */
@Stateless
public class CCBean {

    public CCBean() {}
    public double RupeeToDollar(double a){
        return a/83.96;
    }
    public double RupeeToEuro(double a){
        return a/91;
    }
    public double RupeeToDinar(double a){
        return a/247;
    }
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
