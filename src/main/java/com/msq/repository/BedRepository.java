package com.msq.repository;


import com.msq.entity.Bed;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface BedRepository extends JpaRepository<Bed,Integer> {

    Bed findBedById(int id);

    //根据宿舍名查询床位的所有信息
    List<Bed> findByRoomnameLike(String name);

    //更新床位flag
    @Transactional
    @Modifying
    @Query("update Bed b set b.flag=?2 where b.id=?1")
    void update(int id,String flag);

    //按照房间名床名，来查询bed
    Bed findByRoomnameAndName(String roomname ,String bedname);

    void deleteBedsByRoomname(String roomname);
}
