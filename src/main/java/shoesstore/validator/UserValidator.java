package shoesstore.validator;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import shoesstore.entities.User;
import shoesstore.service.UserService;

public class UserValidator implements Validator{
	private static final Pattern EMAIL_REGEX =
	          Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	private static final Pattern PHONE_REGEX = 
			  Pattern.compile("\\d{10}");
	private UserService<User, Integer> userService;
	
	public UserValidator(UserService<User, Integer> userService) {
		this.userService = userService;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
			
		  ValidationUtils.rejectIfEmpty(errors, "name", "user.name.empty");
	      ValidationUtils.rejectIfEmpty(errors, "password", "user.password.empty");
	      ValidationUtils.rejectIfEmpty(errors, "email", "user.email.empty");
	      ValidationUtils.rejectIfEmpty(errors, "phone", "user.phone.empty");
	      
	      User user = (User) target;
	      
	      if (user.getName() != null && user.getName().length() < 5 ||
	              user.getName().length() > 50) {
	          errors.rejectValue("name", "user.name.size");
	      }
	      
	      if (user.getPhone()!= null &&!PHONE_REGEX.matcher(user.getPhone()).matches()){
	    	  errors.rejectValue("phone", "user.phone.invalid");
	      }
	      
	      if (user.getPassword() != null && user.getPassword().contains(" ")) {
	          errors.rejectValue("password", "user.password.space");
	      }

	      if (user.getPassword() != null && user.getPassword().length() < 5 &&
	              user.getPassword().length() > 15) {
	          errors.rejectValue("password", "user.password.size");
	      }

	      if (user.getEmail() != null && !EMAIL_REGEX.matcher(user.getEmail()).matches()) {
	          errors.rejectValue("email", "user.email.invalid");
	      }
	      
	      if(user !=null && user.getEmail()!= null) {  
	    	  List<User> emailExists = userService.findByProperty("email", user.getEmail());
	    		    	  
	    	  if(emailExists.size() >= 1) {
	    		  errors.rejectValue("email", "user.email.exists");
	    	  }
	      }
	      
	      if(user != null && user.getPhone()!=null) {
	    	  List<User> emailExists = userService.findByProperty("phone", user.getPhone());
	    	  
	    	  if(emailExists.size() >= 1) {
	    		  errors.rejectValue("phone", "user.phone.exists");
	    	  }
	      }
	}

}
