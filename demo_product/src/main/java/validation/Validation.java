package validation;

public class Validation {
    public static boolean checkCode(String code){
        String regexCode ="^M-\\d{4}$";
        return code.matches(regexCode);
    }
}
