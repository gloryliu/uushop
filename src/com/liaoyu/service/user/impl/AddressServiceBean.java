package com.liaoyu.service.user.impl;

import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.user.Address;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.user.AddressService;

@Service 
public class AddressServiceBean extends DaoSupport<Address> implements AddressService {

	@Override
	public int addAddress(Address address, int uid) {
		User user=em.find(User.class, uid);
		address.setUser(user);
		Address nowAddress=em.merge(address);
		return nowAddress.getAid();
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public Set<Address> getAllAddress(int uid) {
		User user=em.getReference(User.class, uid);
		return user.getAddress();
	}

}
