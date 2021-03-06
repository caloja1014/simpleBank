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
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter("Log.txt",true))){
			bf.append("Realizar Transaccion, "+LocalDateTime.now().toString()+"\n");
			System.out.println("Realizar Transaccion consola:, "+LocalDateTime.now().toString());
    	}catch(IOException ex) {
    		ex.printStackTrace();
    	}
    }   
    
    pointcut successRetirar() : call(void Bank.moneyWithdrawal() );
    after() : successRetirar() {   
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter("Log.txt",true))){
			bf.append("Retiro realizado, "+LocalDateTime.now().toString()+"\n");
			System.out.println("Retiro realizado consola, "+LocalDateTime.now().toString());
    	}catch(IOException ex) {
    		ex.printStackTrace();
    	}
    }
}