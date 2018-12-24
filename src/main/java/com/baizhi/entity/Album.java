package com.baizhi.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
import cn.afterturn.easypoi.excel.annotation.ExcelIgnore;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "album")
@ExcelTarget(value = "album")
public class Album implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    @ExcelIgnore
    private Integer id;
    @Excel(name = "标题", needMerge = true)
    private String title;
    @Excel(name = "章节数", needMerge = true)
    private Integer count;
    @Excel(name = "专辑图片", type = 2, width = 40, height = 45, needMerge = true)
    private String cover_img;
    @Excel(name = "评分", needMerge = true)
    private Double score;
    @Excel(name = "作者", needMerge = true)
    private String author;
    @Excel(name = "播音", needMerge = true)
    private String broadcast;
    @Excel(name = "简介", needMerge = true)
    private String brief;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
//    @JSONField(format = "yyyy-MM-dd")
    @Excel(name = "日期", format = "YYYY年MM月dd日", width = 20, needMerge = true)
    private Date pub_date;
    @Transient
    @JsonProperty("children")
    @ExcelCollection(name = "章节")
    private List<Chapter> chapterList;
}
