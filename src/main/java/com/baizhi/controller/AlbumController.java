package com.baizhi.controller;

import com.baizhi.dto.AlbumPageDto;
import com.baizhi.entity.Album;
import com.baizhi.mapper.AlbumMapper;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("album")
public class AlbumController {
    @Autowired
    AlbumService albumService;
    @Autowired
    AlbumMapper albumMapper;

    @RequestMapping("queryAllAlbum")
    @ResponseBody
    public AlbumPageDto queryAllAlbum(int page, int rows) {
//        PageHelper.startPage(page,rows);
        List<Album> albums = albumService.queryAllAlbum(page, rows);
        return new AlbumPageDto(albumMapper.selectCount(new Album()), albums);
    }

    @RequestMapping("queryOneAlbum")
    @ResponseBody
    public Album queryOneAlbum(int id) {
        Album album = albumService.queryOneAlbum(id);
        return album;
    }
}
