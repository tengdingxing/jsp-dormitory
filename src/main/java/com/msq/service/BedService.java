package com.msq.service;

import com.msq.entity.Bed;
import com.msq.entity.Room;
import com.msq.repository.BedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BedService {
    @Autowired
    private BedRepository bedRepository;

    public Bed findBedById(int id){

        return this.bedRepository.findBedById(id);
    }

    //查所有的床铺
    public List<Bed> findBeds(){
        return this.bedRepository.findAll();
    }

    public List<Bed> findBedsByRoomName(String roomname) {
        return this.bedRepository.findByRoomnameLike(roomname);
    }

    public void save(Bed bed) {
        this.bedRepository.save(bed);
    }

    public void deleteById(int id) {
        this.bedRepository.deleteById(id);
    }

    public void update(int id, String flag) {
        this.bedRepository.update(id,flag);
    }
    public Bed findBedByRoomNameAndBedname(String roomname,String bedname){
        Bed byRoomnameAndName = this.bedRepository.findByRoomnameAndName(roomname, bedname);
        return byRoomnameAndName;
    }

    public void deleteByName(String roomname) {
        this.bedRepository.deleteBedsByRoomname(roomname);
    }
}
