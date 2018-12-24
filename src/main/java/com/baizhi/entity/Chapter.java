package com.baizhi.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelIgnore;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "chapter")
public class Chapter implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    @JsonProperty("id")
    @ExcelIgnore
    private String cid;
    @JsonProperty("title")
    @Excel(name = "章节名", width = 12)
    private String ctitle;
    @Excel(name = "大小")
    private String size;
    @Excel(name = "时长")
    private String duration;
    @Excel(name = "地址", width = 44)
    private String url;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
//  @JSONField(format = "yyyy-MM-dd")
    @Excel(name = "上传日期", format = "YYYY-MM-dd", width = 20)
    private Date upload_date;
    private Integer album_id;


}
