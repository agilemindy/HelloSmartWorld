package com.uni.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		String originName = originFile.getName();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		
		// 수정명 : 파일업로드한시간(년월일시분초) + 10000~99999사이의 랜덤값 (5자리랜덤값) + 확장자
		
		int ranNum = (int)(Math.random()*90000+10000);
		String ext = "";
		
		int dot = originName.lastIndexOf(".");
		ext = originName.substring(dot);
		
		String fileName = currentTime + ranNum + ext;
		
		File renameFile = new File(originFile.getParent(), fileName);
		return renameFile;
	}

}
