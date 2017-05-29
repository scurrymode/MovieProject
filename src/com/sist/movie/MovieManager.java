package com.sist.movie;
import java.util.*; //List

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
/*
 * 	Collection : 자료구조
 * List					Set					Map
 * ArrayList	: DataBase(비동기화)			HashMap(key-value): 클래스 등록시 사용
 * Vector : NetWork(동기화)
 * LinkedList
 * 
 * 예외처리
 * 		목적: 비정상종료 방지
 * 		종류: 체크(must), 언체크(해도되도 안해도됨 ex. runtimeException)
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
 * -직접처리 try{정상수행할 수 있는 코드}catch(예외처리종류){  }finally{ }
 * -간접처리
 * -임의발생
 * -사용자정의
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
                                <img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79598/79598_185.jpg" alt="캐리비안의 해적: 죽은 자는 말이 없다 포스터" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-12">12세 이상</span>
                            </span>
	웹크롤링:웹에서 html, xml, json 긁어오는거
	 * */
	public List<MovieVO> movieMainData(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try{
			// 소스읽기
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
				 * 		attr() <a href="값">
				 * 		text() <a>값</a> 
				 * 		html() <a><span>aaa</span><b>bbb</b></a> <a>안의 모든 태그들을 가져올 수 있음
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
