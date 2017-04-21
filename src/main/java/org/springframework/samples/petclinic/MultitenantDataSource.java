package org.springframework.samples.petclinic;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.security.core.context.SecurityContextHolder;


public class MultitenantDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
		String datasourceLookupKey = null;
		if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal() instanceof CustomUserDetails) {
			System.out.println("User: " + SecurityContextHolder.getContext().getAuthentication().getName());
			
			CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
			if(userDetails.getCompanyName() != null){
				logger.info(String.format("User %s from Company %s", userDetails.getUserName(),
						userDetails.getCompanyName()));
				datasourceLookupKey = userDetails.getCompanyName().toLowerCase();
			}
		}
		logger.warn("datasourceLookupKey: " + datasourceLookupKey);
		return datasourceLookupKey;
    }
}
