package shoesstore.validator;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import shoesstore.entities.Product;
import shoesstore.service.ProductService;

public class ProductValidator implements Validator{
	private ProductService<Product, Integer> productService;
	
	public ProductValidator(ProductService<Product, Integer> productService) {
		this.productService = productService;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "code", "product.code.empty");
	    ValidationUtils.rejectIfEmpty(errors, "name", "product.name.empty");
	    ValidationUtils.rejectIfEmpty(errors, "price", "product.price.empty");
//	    Product product = (Product) target;
//	    if(product!=null && product.getCode()!=null) {
//	    	List<Product> productCodeExists = productService.findByProperty("code", product.getCode());
//	    	if(productCodeExists.size()>=1) {
//	    		errors.rejectValue("code", "product.code.exists");
//	    	}
//	    }
	}

}
