/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

/**
 *
 * @author Admin
 */
public class Checker {
    String name, age, mail, hobby, gender, error;
    public void Checker() {
        error="";
    }
    
    public void setName(String n) {
        name = n;
    } public void setAge(String a) {
        age = a;
    } public void setMail(String m) {
        mail = m;
    } public void setHobby(String h) {
        hobby = h;
    } public void setGender(String g) {
        gender = g;
    } public void setError(String e) {
        error = e;
    }
    
    public String getName() {
        return name;
    } public String getAge() {
        return age;
    } public String getMail() {
        return mail;
    } public String getHobby() {
        return hobby;
    } public String getGender() {
        return gender;
    } public String getError() {
        return error;
    } 
    
    public boolean validate() {
        boolean res = true;
        if (name.trim().equals("") || (name==null)) {
            error+= "<br>Enter first name";
            res = false;
        }
        
        if (age.length()>2 || (age==null)) {
            error+= " "+age+ " Age Invalid";
            res = false;
        }
       
        return res; 
    }
    
    
}
