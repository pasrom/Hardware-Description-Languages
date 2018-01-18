`timescale 1ns/1ns

module tb_prescale_50m_1m();
    // (1) DUT wiring
    logic           rst_n;
    logic           clk50m;
    logic           en50m_1m;
    // (2) DUT instance
    prescale_50m_1m dut(.*);
    
    // (3) Stimuli
    logic run_sim = 1'b1;
    int err_cnt = 0;
    string action = "init";
    int  edges = 0;
    time t1,t2,t3;
    time en_hitime;
    time en_period;
    
    initial begin : clk_gen
        clk50m = 1'b1;
        while (run_sim) begin
            #10ns;
            clk50m = ~clk50m;
        end
    end
    
    initial begin : test_pattern
        $display("----------------------------");
        $display("tb_prescale_50m_100 started");
        rst_n = 1'b0;
        #10ns
        // Check initial value of en
        if (en50m_1m != 1'b0) begin
            err_cnt++;
            $error("Wrong intial value of en50m_1m");
        end
        else begin
            $display("\tInitial value --> pass.");
        end
        #90ns;
        action = "por";
        rst_n = 1'b1;
        
        $display("\tWait for two edges of en50m_1m before automatic checkers are enabled");
        while (edges < 2) begin
            @ (posedge en50m_1m);
            
        end
        
        repeat(10) begin
            @ (negedge en50m_1m);
            
            if (en_period == 50*20ns) begin
                $display("\tMeasured period = %d ns --> pass.",en_period);
            end
            else begin
                $error("Wrong period");
                err_cnt++;
            end
            if (en_hitime == 20ns) begin
                $display("\tMeasured hitime = %d ns --> pass.",en_hitime);
            end
            else begin
                $error("Wrong hitime");
                err_cnt++;
            end
            
        end
        
        #1us;
        run_sim = 1'b0;
        if (err_cnt == 0) begin
            $display("PASS: tb_prescale_50m_100 finished w/o errors");
        end
        else begin
            $display("FAIL: tb_prescale_50m_100 finished with %d errors",err_cnt);
        end
        $display("----------------------------");
    end
    
    // (4) Checker
    
    always @ (posedge en50m_1m) begin
        edges++;
        t3 = t1;
        t1 = $time;
        en_period = t1-t3;
        
    end
    
    always @ (negedge en50m_1m) begin
        t2 = $time;
        en_hitime = t2-t1;
        
    end
    
endmodule
