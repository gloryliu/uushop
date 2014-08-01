package com.liaoyu.service.user;


import java.util.Set;

import com.liaoyu.bean.user.Address;

public interface AddressService {
	public abstract int addAddress(Address address,int uid);
	public abstract Set<Address> getAllAddress(int uid);
}
