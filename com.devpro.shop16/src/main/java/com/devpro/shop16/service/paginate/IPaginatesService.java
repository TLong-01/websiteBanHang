package com.devpro.shop16.service.paginate;

import com.devpro.shop16.service.PagerData;
import org.springframework.stereotype.Service;

@Service
public interface IPaginatesService {
	public PagerData GetInfoPaginates(int totalItems, int limit, int currentPage);

}
