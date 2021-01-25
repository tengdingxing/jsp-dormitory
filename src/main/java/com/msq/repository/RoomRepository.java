package com.msq.repository;

import com.msq.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface RoomRepository extends JpaRepository<Room,Integer> {

    //根据id查询room
    Room findRoomById(int id);

    //根据名字，查询room
    Room findRoomByName(String name);

    //更新床位数
    @Transactional
    @Modifying
    @Query("update Room r set r.bedcount=?2 where r.name=?1 ")
    void update(String roomname,int count);

    @Transactional
    @Modifying
    @Query("UPDATE Room r set r.flag=?2 where r.name=?1")
    void updateFlag(String roomname,String flag);
}
