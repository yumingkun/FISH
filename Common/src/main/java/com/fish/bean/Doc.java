package com.fish.bean;



public class Doc {

	private int id;
	private String filename;
	private String savepath;
	private long filesize;
	private String filetype;
	private String memo;
	private String isshare;
	private String username;
	private String uploaddate;
	private int count;
	public int getId() {
		return id;
	}
	 
	

	 public Doc() {
		super();
	}



	public Doc(int id, String filename, String savepath, long filesize,String filetype, String memo, String isshare, String username, String uploaddate, int count) {
			super();
			this.id = id;
			this.filename = filename;
			this.savepath = savepath;
			this.filesize = filesize;

			this.filetype = filetype;
			this.memo = memo;
			this.isshare = isshare;
			this.username = username;
			this.uploaddate = uploaddate;
			this.count = count;
		}
	public Doc(String filename, String savepath, long filesize,  String filetype, String memo, String isshare, String username, String uploaddate, int count) {
		super();
		 
		this.filename = filename;
		this.savepath = savepath;
		this.filesize = filesize;
		this.filetype = filetype;
		this.memo = memo;
		this.isshare = isshare;
		this.username = username;
		this.uploaddate = uploaddate;
		this.count = count;
	}
	
 


 
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getIsshare() {
		return isshare;
	}
	public void setIsshare(String isshare) {
		this.isshare = isshare;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Doc [id=" + id + ", filename=" + filename + ", savepath="
				+ savepath + ", filesize=" + filesize
				+ ", filetype=" + filetype + ", memo=" + memo + ", isshare="
				+ isshare + ", username=" + username + ", uploaddate="
				+ uploaddate + ", count=" + count + "]";
	}
	

	

}
