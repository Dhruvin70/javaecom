package com.DAL;
import com.entity.User;

public interface UserDAL {
    public boolean userRegistration(User us);
    
    public User userLogin(String email, String password);
    
    public boolean updateDatabase(String fieldId, String newData, int userId);
    
    public User getUserById(int userId);

}
