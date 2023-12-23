package com.DAL;

import java.util.List;

import com.entity.Items;
public interface ItemsDAO {
	
	public boolean itemInsertion (Items item) ;
	
	public List<Items> getAllItems();
	
	public Items getItemsByCode(String code);

}
