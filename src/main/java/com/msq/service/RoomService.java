package com.msq.service;

import com.msq.entity.Room;
import com.msq.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    public Room findRoomById(int id){

        return this.roomRepository.findRoomById(id);
    }

    public Room findRoomByName(String name){
        return this.roomRepository.findRoomByName(name);
    }


    public List<Room> findAll() {
        return this.roomRepository.findAll();
    }

    public void saveRoom(Room room) {
         this.roomRepository.save(room);
    }

    public void deleteRoom(int id) {
        this.roomRepository.deleteById(id);
    }

    public void update(String roomname, int count) {
        this.roomRepository.update(roomname,count);
    }

    public void updateFlag(String room, String flag) {
        this.roomRepository.updateFlag(room,flag);
    }
}
