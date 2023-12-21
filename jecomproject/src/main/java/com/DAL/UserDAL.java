package com.DAL;
import com.entity.User;

public interface UserDAL {
    public boolean userRegistration(User us);
    
    public User userLogin(String email, String password);

}
