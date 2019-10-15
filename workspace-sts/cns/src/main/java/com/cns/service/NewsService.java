package com.cns.service;

import java.util.List;

import com.cns.dto.Criteria;
import com.cns.dto.NewsVO;
import com.cns.dto.ScrapVO;
import com.cns.dto.TagVO;
import com.cns.dto.UserVO;

public interface NewsService {

	public List<NewsVO> selectNews() throws Exception;
	public List<NewsVO> getCFNews(UserVO user) throws Exception;
	public List<NewsVO> getListWithPaging(Criteria cri) throws Exception;
	
	//total get
	public int getTotal(String category) throws Exception;
	public int getTotalPress(String press) throws Exception;
	
	//기사 get
	public NewsVO getNews(NewsVO newsVO) throws Exception;
	
	//태그get
	public List<TagVO> getTag(long news_id) throws Exception;
	public List<TagVO> getUserTag(UserVO user) throws Exception;

	
	
	// 카테고리
	public List<NewsVO> selectPolitics(Criteria cri) throws Exception;

	public List<NewsVO> selectLiving(Criteria cri) throws Exception;

	public List<NewsVO> selectIT(Criteria cri) throws Exception;

	public List<NewsVO> selectSociety(Criteria cri) throws Exception;

	public List<NewsVO> selectEconomy(Criteria cri) throws Exception;
	
	public List<NewsVO> selectPress(Criteria cri) throws Exception;

	
	// 신문사
	public List<NewsVO> selectChosun() throws Exception;

	public List<NewsVO> selectDonga() throws Exception;

	public List<NewsVO> selectHankyoreh() throws Exception;

	public List<NewsVO> selectJoongang() throws Exception;

	public List<NewsVO> selectYonhap() throws Exception;
	
	//signUp
	public int signUp(UserVO user) throws Exception;
	public int login(UserVO user) throws Exception;
	public UserVO getUser(UserVO user) throws Exception;
	public List<NewsVO> getUserTagNews(UserVO userVO) throws Exception;
	public void updateTag(Long news_id) throws Exception;
	public void setUserTag(UserVO userVO, Long news_id) throws Exception;
	public Object getAssociated(Long news_id);
	public List<NewsVO> getTagNews(TagVO tag);
	public void insertScrap(UserVO userVO, Long news_id);
	public List<NewsVO> selectScrap(UserVO uservo);
	
}
