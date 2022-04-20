package shoesstore.validator;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import shoesstore.entities.Role;
import shoesstore.service.RoleService;

public class RoleValidator implements Validator {
	private RoleService<Role, Integer> roleService;
	
	public RoleValidator(RoleService<Role, Integer> roleService) {
		this.roleService = roleService;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return Role.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", "role.name.empty");
		 Role role = (Role) target;
		if(role!=null && role.getName()!=null) {
			List<Role>  roleNameExists= roleService.findByProperty("name", role.getName());
			if(roleNameExists.size()>=1) {
				errors.rejectValue("name", "role.name.exists");
			}
		}
	}

}
