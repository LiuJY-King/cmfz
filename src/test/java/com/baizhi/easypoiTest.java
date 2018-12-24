package com.baizhi;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.mapper.AlbumMapper;
import com.baizhi.mapper.ChapterMapper;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class easypoiTest {
    @Autowired
    AlbumMapper albumMapper;
    @Autowired
    ChapterMapper chapterMapper;

    @Test
    public void testExport() {
        List<Album> albums = albumMapper.queryAllAlbum(1, 5);
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("专辑章节", "章节"),
                Album.class, albums);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File("F:/easypoi.xls"));
            workbook.write(fileOutputStream);
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testExport1() {
        List<Chapter> chapters = chapterMapper.selectAll();
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("专辑章节", "章节"),
                Chapter.class, chapters);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File("F:/easypoi.xls"));
            workbook.write(fileOutputStream);
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
