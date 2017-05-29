package com.sist.movie;
import java.util.*; //List

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
/*
 * 	Collection : �ڷᱸ��
 * List					Set					Map
 * ArrayList	: DataBase(�񵿱�ȭ)			HashMap(key-value): Ŭ���� ��Ͻ� ���
 * Vector : NetWork(����ȭ)
 * LinkedList
 * 
 * ����ó��
 * 		����: ���������� ����
 * 		����: üũ(must), ��üũ(�ص��ǵ� ���ص��� ex. runtimeException)
 * 		Object
 * 		Throwable
 * 		1. Error 
 * 		2. Exception 	1) Check		1. IOException 2. SQLException 3. ClassNotFoundException
 * 							2) nonCheck	RuntimeException 1. ArrayIndexOutOfBoundsException
 * 																		2. NumberFormatException
 * 																		3. NullPointerException
 * 																		4. ClassCastException
 * 																		5. ArithmeticException
 * 
 * -����ó�� try{��������� �� �ִ� �ڵ�}catch(����ó������){  }finally{ }
 * -����ó��
 * -���ǹ߻�
 * -���������
 * 
 * */
public class MovieManager {
	public static void main(String[] args){
		MovieManager mm = new MovieManager();
		mm.movieMainData();
	}
	
	/*
	 * <div class="box-image" >
                        <strong class="rank">No.1</strong>	
                        <a href="/movies/detail-view/?midx=79598">
                            <span class="thumb-image">
                                <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79598/79598_185.jpg" alt="ĳ������� ����: ���� �ڴ� ���� ���� ������" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-12">12�� �̻�</span>
                            </span>
	��ũ�Ѹ�:������ html, xml, json �ܾ���°�
	 * */
	public List<MovieVO> movieMainData(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try{
			// �ҽ��б�
			Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			//System.out.println(doc);
			Elements poster = doc.select("div.box-image a span.thumb-image img");
			Elements grade = doc.select("div.box-image span.ico-grade");
			Elements link = doc.select("div.box-contents a");
			///////////
			Elements movie = doc.select("div.box-image");
			//////////
			int j=0;
			for(int i=0; i<7;i++){
				Element pelem=poster.get(i);
				String image=pelem.attr("src");
				Element gelem = grade.get(i);
				Element lelem = link.get(j);
				j+=2;
				/////
				String linking = movie.get(i).select("a").attr("href");
				System.out.println(linking);
				///////
				
				//System.out.println(image+" "+gelem.text()+" "+lelem.attr("href"));
				/*
				 * 		attr() <a href="��">
				 * 		text() <a>��</a> 
				 * 		html() <a><span>aaa</span><b>bbb</b></a> <a>���� ��� �±׵��� ������ �� ����
				 * */
				MovieVO vo = new MovieVO();
				String link_data=lelem.attr("href");
				link_data=link_data.substring(link_data.lastIndexOf("=")+1);
				vo.setPoster(image);
				vo.setGrade(gelem.text());
				vo.setLink(link_data);
				list.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return list;
	}
}
