class generator;
	transaction tx,temp,txQ[$];

task run();
//	$display("generator functionality has been done");
	case(common::test_name)
		"1WR":begin
			common::gen_count=1;
			tx=new();
			assert(tx.randomize() with{tx.wr_rd==1;})
			tx.print("1WR");
			temp=new tx;
			common::gen2bfm.put(temp);
		end
		"5WR":begin
			common::gen_count=5;
				tx=new();
			repeat(5)begin
				assert(tx.randomize() with{tx.wr_rd==1;})
				tx.print("5WR");
				temp=new tx;
			common::gen2bfm.put(temp );
			end
		end
		"1WR_1RD":begin
			common::gen_count=2;
			tx=new();
			assert(tx.randomize() with{tx.wr_rd==1;})
			temp=new tx;
			tx.print("1WR");
			common::gen2bfm.put(temp);
			
			tx=new();
			assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
			tx.print("1RD");
		end	
		"5WR_5RD":begin
			common::gen_count=10;
				tx=new();
			repeat(5)begin
				assert(tx.randomize() with{tx.wr_rd==1;})
				temp=new tx;
				txQ.push_back(temp);
				tx.print("5WR");
				common::gen2bfm.put(temp);
			end
			repeat(5)begin
				tx=new();
				temp=txQ.pop_front();
				assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;})
				tx.print("5RD");
				common::gen2bfm.put(tx);
			end
		end	
		"NWR_NRD":begin
			common::gen_count=2*common::N;
				tx=new();
			repeat(common::N)begin
				assert(tx.randomize() with{tx.wr_rd==1;})
				temp=new tx;
				txQ.push_back(temp);
				tx.print("NWR");
				common::gen2bfm.put(temp);
			end
			repeat(common::N)begin
				tx=new();
				temp=txQ.pop_front();
				assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;})
				tx.print("NRD");
				common::gen2bfm.put(tx);
			end
		end	


	endcase
endtask
endclass
