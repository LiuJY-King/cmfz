package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.mapper.AlbumMapper;
import com.baizhi.mapper.ChapterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    ChapterMapper chapterMapper;
    @Autowired
    AlbumMapper albumMapper;

    @Override
    public void addOneChapter(Chapter chapter) {
        chapterMapper.insert(chapter);
        //album的数量加1
        Integer album_id = chapter.getAlbum_id();

        Album album = new Album();
        album.setId(album_id);

        Album album1 = albumMapper.selectOne(album);
        Integer count = album1.getCount();
        if (count == null) {
            album1.setCount(1);
        } else {
            album1.setCount(count + 1);
        }
//        albumMapper.updateByPrimaryKey(album);
        albumMapper.updateByPrimaryKeySelective(album1);
    }
}
