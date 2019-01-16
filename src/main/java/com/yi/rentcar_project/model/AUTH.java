package com.yi.rentcar_project.model;

public class AUTH {
	  private String id;
	   private String name;
	   private boolean admin;

	   public AUTH() {}  

	   public AUTH(String id, String name, boolean admin) {
	      this.id = id;
	      this.name = name;
	      this.admin = admin;
	   }
	   
	   

	   
	   public AUTH(String id) {
		super();
		this.id = id;
	}

	public AUTH(String id, boolean admin) {
		super();
		this.id = id;
		this.admin = admin;
	}

	public String getId() {
	      return id;
	   }

	   public void setId(String id) {
	      this.id = id;
	   }

	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public boolean isAdmin() {
	      return admin;
	   }

	   public void setAdmin(boolean admin) {
	      this.admin = admin;
	   }

	 

}
