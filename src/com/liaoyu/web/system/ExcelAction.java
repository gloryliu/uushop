package com.liaoyu.web.system;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.Book;
import com.liaoyu.service.book.BookService;

@Controller
public class ExcelAction {
	private String fileName;	//Excel文件名
	private InputStream excelStream;	//导出文件流对象
	@Resource BookService bs;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public InputStream getExcelStream() {
		return excelStream;
	}
	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}
	//将商品信息进行Excel导出
	public String execute() throws Exception{
		//设置文件名
		this.fileName="books";
		//创建Workbook对象
		Workbook workbook=new HSSFWorkbook();
		//创建页
		Sheet sheet=workbook.createSheet("Sheet1");
		//创建首行商品名称等
		Row row=sheet.createRow(0);
		row.createCell(0).setCellValue("图书ID");
		row.createCell(1).setCellValue("图书名称");
		row.createCell(2).setCellValue("价格(元)");
		row.createCell(3).setCellValue("作者");
		row.createCell(4).setCellValue("出版社");
		row.createCell(5).setCellValue("出版日期");
		row.createCell(6).setCellValue("图片");
		row.createCell(7).setCellValue("描述");
		row.createCell(8).setCellValue("图书类型");
		row.createCell(9).setCellValue("评论数量");
		row.createCell(10).setCellValue("库存数量");
		row.createCell(11).setCellValue("售出数量");
		row.createCell(12).setCellValue("收藏数量");
		
		//获取所有商品信息
		List<Book> books=bs.selectAll();
		
		//将商品信息依次写入单元格
		int count=1;
		for(Book book:books){
			Row rw=sheet.createRow(count);
			rw.createCell(0).setCellValue(book.getBid());
			rw.createCell(1).setCellValue(book.getBname());
			rw.createCell(2).setCellValue(book.getPrice());
			rw.createCell(3).setCellValue(book.getAuthor());
			rw.createCell(4).setCellValue(book.getPublishCompany());
			rw.createCell(5).setCellValue(book.getPublishDate());
			rw.createCell(6).setCellValue(book.getImage());
			rw.createCell(7).setCellValue(book.getBookInfo());
			rw.createCell(8).setCellValue(book.getBookType().getbType()+"/"+book.getBookType().getsType());
			rw.createCell(9).setCellValue(book.getCommentCount());
			rw.createCell(10).setCellValue(book.getInventoryCount());
			rw.createCell(11).setCellValue(book.getSaleCount());
			rw.createCell(12).setCellValue(book.getCollectCount());
			count++;
		}
		
		//将workbook对象读入一个输出流
		ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
		workbook.write(outputStream);
		
		//将流对象写入输入流
		byte []buf=outputStream.toByteArray();
		this.excelStream=new ByteArrayInputStream(buf, 0, buf.length);
		return "toExcel";
	}
}
