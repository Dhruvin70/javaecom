package com.DAL;

import java.util.List;

import com.entity.Items;
public interface ItemsDAO {
	
	public boolean itemInsertion (Items item) ;
	
	public List<Items> getAllItems();
	
	public Items getItemsById(int id);

	public boolean updateById(Items code);
	
	public boolean deleteById(int id);
	
	public List<Items> getNewBooks();
	
}
