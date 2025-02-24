package com.cns.dto;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class NewsVO {
 
	
    private Long news_id;
    private String news_title;
    private String news_content;
    private String press;
    private String category;
    private Date date_of_news;
    private int news_count;
    private String summarize;
    private String image;


 
}

