package com.baizhi.controller;

import com.baizhi.conf.FileUtil;
import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("chapter")
public class ChapterController {
    @Autowired
    ChapterService chapterService;

    @RequestMapping("addChapter")
    @ResponseBody
    public void addAlbum(Chapter chapter, HttpSession session, MultipartFile file3) throws IOException {

        String s = UUID.randomUUID().toString().replace("-", "");
        chapter.setCid(s);

        chapter.setUpload_date(new Date());

        String path = session.getServletContext().getRealPath("/music");
        String filename = file3.getOriginalFilename();
        long time = new Date().getTime();
        String newName = time + filename;

        File file = new File(path + "/" + newName);
        file3.transferTo(file);

//        获取文件大小
        String fileSize = FileUtil.getFileSize(path + "/" + newName);
        chapter.setSize(fileSize);
//        获取文件时长
        String duration = FileUtil.getDuration(path + "/" + newName);
        chapter.setDuration(duration);

        chapter.setUrl("/" + newName);
        chapterService.addOneChapter(chapter);
    }

    //文件下载
    @RequestMapping("download")
    public void downloadChapter(String fileName, HttpSession session, HttpServletResponse response) throws Exception {

        String realPath = session.getServletContext().getRealPath("/music");
        File file = new File(realPath + "/" + fileName);
        String s[] = fileName.split("/");
        String fileName1 = s[1];

        response.setHeader("Content-Disposition", "attachment;fileName1=" + URLEncoder.encode(fileName1, "UTF-8"));

        byte[] buffer = new byte[1024];
        FileInputStream fis = null; //文件输入流
        BufferedInputStream bis = null;

        OutputStream os = null; //输出流

        os = response.getOutputStream();
        fis = new FileInputStream(file);
        bis = new BufferedInputStream(fis);
        int i = bis.read(buffer);
        while (i != -1) {
            os.write(buffer);
            i = bis.read(buffer);
        }
    }
}

