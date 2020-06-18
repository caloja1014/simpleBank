import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Calendar;
import com.bank.*;



public aspect Logger {
	
    pointcut success() : call(void Bank.moneyMakeTransaction() );
    after() : success() {   
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter("Log.txt"))){
			bf.write("Realizar Transaccion, "+LocalDateTime.now().toString());
    	}catch(IOException ex) {
    		ex.printStackTrace();
    	}
    }    
}

