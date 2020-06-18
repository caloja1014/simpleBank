import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Calendar;
import com.bank.*;

public aspect Logger{
	pointcut success() : call(void Bank.moneyMakeTransaction());
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	try(BufferedWriter bff=new BufferedWriter(new FileWriter("log.txt"));){
        	Calendar cal = Calendar.getInstance();
        	String esc="Transancción de dinero con fecha de "+cal.getTime().toString();
        	System.out.println(esc);
        	bff.append(esc);
        	bff.newLine();
    	}catch(IOException ex) {
    		System.out.println(ex.getMessage());
    		
    	}

    }

    pointcut retire() :call(void moneyWithdrawal());
    after(): retire() {
    	try(BufferedWriter bff=new BufferedWriter(new FileWriter("log.txt"));){
        	Calendar cal = Calendar.getInstance();
        	String esc="Retiro de dinero con fecha de "+cal.getTime().toString();
        	System.out.println(esc);
        	bff.append(esc);
        	bff.newLine();
    	}catch(IOException ex) {
    		System.out.println(ex.getMessage());
    	}
    	
    }
}

