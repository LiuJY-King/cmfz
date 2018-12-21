package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.mapper.AlbumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    AlbumMapper albumMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Album> queryAllAlbum(int page, int rows) {
        List<Album> albums = albumMapper.queryAllAlbum(page, rows);
        return albums;
    }

    @Override
    public Album queryOneAlbum(Integer id) {
        Album album = new Album();
        album.setId(id);
        album = albumMapper.selectOne(album);
        return album;
    }
}
