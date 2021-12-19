library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity DaddaTree is
	generic
	(
		nbit : integer := 32
	);
	port
	(
		P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16 : in std_logic_vector(nbit downto 0);
		S : in std_logic_vector(nbit/2-1 downto 0);
		O1, O2: out std_logic_vector(2*nbit-1 downto 0)
	);
end entity;

architecture Structural of DaddaTree is

	component HA is 
		port
		(
			A, B: in std_logic;
			O, Co: out std_logic
		);
	end component;

	component FA is 
		port
		(
			A, B, Ci: in std_logic;
			O, Co: out std_logic
		);
	end component;

	type st_type0 is array (integer range 0 to 2-1) of std_logic_vector(2*nbit downto 0);
	signal stage0 : st_type0;
	type st_type1 is array (integer range 0 to 3-1) of std_logic_vector(2*nbit downto 0);
	signal stage1 : st_type1;
	type st_type2 is array (integer range 0 to 4-1) of std_logic_vector(2*nbit downto 0);
	signal stage2 : st_type2;
	type st_type3 is array (integer range 0 to 6-1) of std_logic_vector(2*nbit downto 0);
	signal stage3 : st_type3;
	type st_type4 is array (integer range 0 to 9-1) of std_logic_vector(2*nbit downto 0);
	signal stage4 : st_type4;
	type st_type5 is array (integer range 0 to 13-1) of std_logic_vector(2*nbit downto 0);
	signal stage5 : st_type5;
	type st_type6 is array (integer range 0 to 17-1) of std_logic_vector(2*nbit downto 0);
	signal stage6 : st_type6;

	begin

		stage6(0)(32 downto 0) <= P0;
		stage6(0)(35) <= not S(0);
		stage6(0)(34 downto 33) <= (others => S(0));
		stage6(1)(0) <= S(0);
		stage6(1)(34 downto 2) <= P1;
		stage6(1)(36 downto 35) <= ('1' & not S(1));
		stage6(2)(2) <= S(1);
		stage6(2)(36 downto 4) <= P2;
		stage6(2)(38 downto 37) <= ('1' & not S(2));
		stage6(3)(4) <= S(2);
		stage6(3)(38 downto 6) <= P3;
		stage6(3)(40 downto 39) <= ('1' & not S(3));
		stage6(4)(6) <= S(3);
		stage6(4)(40 downto 8) <= P4;
		stage6(4)(42 downto 41) <= ('1' & not S(4));
		stage6(5)(8) <= S(4);
		stage6(5)(42 downto 10) <= P5;
		stage6(5)(44 downto 43) <= ('1' & not S(5));
		stage6(6)(10) <= S(5);
		stage6(6)(44 downto 12) <= P6;
		stage6(6)(46 downto 45) <= ('1' & not S(6));
		stage6(7)(12) <= S(6);
		stage6(7)(46 downto 14) <= P7;
		stage6(7)(48 downto 47) <= ('1' & not S(7));
		stage6(8)(14) <= S(7);
		stage6(8)(48 downto 16) <= P8;
		stage6(8)(50 downto 49) <= ('1' & not S(8));
		stage6(9)(16) <= S(8);
		stage6(9)(50 downto 18) <= P9;
		stage6(9)(52 downto 51) <= ('1' & not S(9));
		stage6(10)(18) <= S(9);
		stage6(10)(52 downto 20) <= P10;
		stage6(10)(54 downto 53) <= ('1' & not S(10));
		stage6(11)(20) <= S(10);
		stage6(11)(54 downto 22) <= P11;
		stage6(11)(56 downto 55) <= ('1' & not S(11));
		stage6(12)(22) <= S(11);
		stage6(12)(56 downto 24) <= P12;
		stage6(12)(58 downto 57) <= ('1' & not S(12));
		stage6(13)(24) <= S(12);
		stage6(13)(58 downto 26) <= P13;
		stage6(13)(60 downto 59) <= ('1' & not S(13));
		stage6(14)(26) <= S(13);
		stage6(14)(60 downto 28) <= P14;
		stage6(14)(62 downto 61) <= ('1' & not S(14));
		stage6(15)(28) <= S(14);
		stage6(15)(62 downto 30) <= P15;
		stage6(15)(63) <= not S(15);
		stage6(16)(30) <= S(15);
		stage6(16)(64 downto 32) <= P16;

	--stage 6:

	--n_col 0:
		stage5(0)(0) <= stage6(0)(0);
		stage5(1)(0) <= stage6(1)(0);
	--n_col 1:
		stage5(0)(1) <= stage6(0)(1);
	--n_col 2:
		stage5(0)(2) <= stage6(0)(2);
		stage5(1)(2) <= stage6(1)(2);
		stage5(2)(2) <= stage6(2)(2);
	--n_col 3:
		stage5(0)(3) <= stage6(0)(3);
		stage5(1)(3) <= stage6(1)(3);
	--n_col 4:
		stage5(0)(4) <= stage6(0)(4);
		stage5(1)(4) <= stage6(1)(4);
		stage5(2)(4) <= stage6(2)(4);
		stage5(3)(4) <= stage6(3)(4);
	--n_col 5:
		stage5(0)(5) <= stage6(0)(5);
		stage5(1)(5) <= stage6(1)(5);
		stage5(2)(5) <= stage6(2)(5);
	--n_col 6:
		stage5(0)(6) <= stage6(0)(6);
		stage5(1)(6) <= stage6(1)(6);
		stage5(2)(6) <= stage6(2)(6);
		stage5(3)(6) <= stage6(3)(6);
		stage5(4)(6) <= stage6(4)(6);
	--n_col 7:
		stage5(0)(7) <= stage6(0)(7);
		stage5(1)(7) <= stage6(1)(7);
		stage5(2)(7) <= stage6(2)(7);
		stage5(3)(7) <= stage6(3)(7);
	--n_col 8:
		stage5(0)(8) <= stage6(0)(8);
		stage5(1)(8) <= stage6(1)(8);
		stage5(2)(8) <= stage6(2)(8);
		stage5(3)(8) <= stage6(3)(8);
		stage5(4)(8) <= stage6(4)(8);
		stage5(5)(8) <= stage6(5)(8);
	--n_col 9:
		stage5(0)(9) <= stage6(0)(9);
		stage5(1)(9) <= stage6(1)(9);
		stage5(2)(9) <= stage6(2)(9);
		stage5(3)(9) <= stage6(3)(9);
		stage5(4)(9) <= stage6(4)(9);
	--n_col 10:
		stage5(0)(10) <= stage6(0)(10);
		stage5(1)(10) <= stage6(1)(10);
		stage5(2)(10) <= stage6(2)(10);
		stage5(3)(10) <= stage6(3)(10);
		stage5(4)(10) <= stage6(4)(10);
		stage5(5)(10) <= stage6(5)(10);
		stage5(6)(10) <= stage6(6)(10);
	--n_col 11:
		stage5(0)(11) <= stage6(0)(11);
		stage5(1)(11) <= stage6(1)(11);
		stage5(2)(11) <= stage6(2)(11);
		stage5(3)(11) <= stage6(3)(11);
		stage5(4)(11) <= stage6(4)(11);
		stage5(5)(11) <= stage6(5)(11);
	--n_col 12:
		stage5(0)(12) <= stage6(0)(12);
		stage5(1)(12) <= stage6(1)(12);
		stage5(2)(12) <= stage6(2)(12);
		stage5(3)(12) <= stage6(3)(12);
		stage5(4)(12) <= stage6(4)(12);
		stage5(5)(12) <= stage6(5)(12);
		stage5(6)(12) <= stage6(6)(12);
		stage5(7)(12) <= stage6(7)(12);
	--n_col 13:
		stage5(0)(13) <= stage6(0)(13);
		stage5(1)(13) <= stage6(1)(13);
		stage5(2)(13) <= stage6(2)(13);
		stage5(3)(13) <= stage6(3)(13);
		stage5(4)(13) <= stage6(4)(13);
		stage5(5)(13) <= stage6(5)(13);
		stage5(6)(13) <= stage6(6)(13);
	--n_col 14:
		stage5(0)(14) <= stage6(0)(14);
		stage5(1)(14) <= stage6(1)(14);
		stage5(2)(14) <= stage6(2)(14);
		stage5(3)(14) <= stage6(3)(14);
		stage5(4)(14) <= stage6(4)(14);
		stage5(5)(14) <= stage6(5)(14);
		stage5(6)(14) <= stage6(6)(14);
		stage5(7)(14) <= stage6(7)(14);
		stage5(8)(14) <= stage6(8)(14);
	--n_col 15:
		stage5(0)(15) <= stage6(0)(15);
		stage5(1)(15) <= stage6(1)(15);
		stage5(2)(15) <= stage6(2)(15);
		stage5(3)(15) <= stage6(3)(15);
		stage5(4)(15) <= stage6(4)(15);
		stage5(5)(15) <= stage6(5)(15);
		stage5(6)(15) <= stage6(6)(15);
		stage5(7)(15) <= stage6(7)(15);
	--n_col 16:
		stage5(0)(16) <= stage6(0)(16);
		stage5(1)(16) <= stage6(1)(16);
		stage5(2)(16) <= stage6(2)(16);
		stage5(3)(16) <= stage6(3)(16);
		stage5(4)(16) <= stage6(4)(16);
		stage5(5)(16) <= stage6(5)(16);
		stage5(6)(16) <= stage6(6)(16);
		stage5(7)(16) <= stage6(7)(16);
		stage5(8)(16) <= stage6(8)(16);
		stage5(9)(16) <= stage6(9)(16);
	--n_col 17:
		stage5(0)(17) <= stage6(0)(17);
		stage5(1)(17) <= stage6(1)(17);
		stage5(2)(17) <= stage6(2)(17);
		stage5(3)(17) <= stage6(3)(17);
		stage5(4)(17) <= stage6(4)(17);
		stage5(5)(17) <= stage6(5)(17);
		stage5(6)(17) <= stage6(6)(17);
		stage5(7)(17) <= stage6(7)(17);
		stage5(8)(17) <= stage6(8)(17);
	--n_col 18:
		stage5(0)(18) <= stage6(0)(18);
		stage5(1)(18) <= stage6(1)(18);
		stage5(2)(18) <= stage6(2)(18);
		stage5(3)(18) <= stage6(3)(18);
		stage5(4)(18) <= stage6(4)(18);
		stage5(5)(18) <= stage6(5)(18);
		stage5(6)(18) <= stage6(6)(18);
		stage5(7)(18) <= stage6(7)(18);
		stage5(8)(18) <= stage6(8)(18);
		stage5(9)(18) <= stage6(9)(18);
		stage5(10)(18) <= stage6(10)(18);
	--n_col 19:
		stage5(0)(19) <= stage6(0)(19);
		stage5(1)(19) <= stage6(1)(19);
		stage5(2)(19) <= stage6(2)(19);
		stage5(3)(19) <= stage6(3)(19);
		stage5(4)(19) <= stage6(4)(19);
		stage5(5)(19) <= stage6(5)(19);
		stage5(6)(19) <= stage6(6)(19);
		stage5(7)(19) <= stage6(7)(19);
		stage5(8)(19) <= stage6(8)(19);
		stage5(9)(19) <= stage6(9)(19);
	--n_col 20:
		stage5(0)(20) <= stage6(0)(20);
		stage5(1)(20) <= stage6(1)(20);
		stage5(2)(20) <= stage6(2)(20);
		stage5(3)(20) <= stage6(3)(20);
		stage5(4)(20) <= stage6(4)(20);
		stage5(5)(20) <= stage6(5)(20);
		stage5(6)(20) <= stage6(6)(20);
		stage5(7)(20) <= stage6(7)(20);
		stage5(8)(20) <= stage6(8)(20);
		stage5(9)(20) <= stage6(9)(20);
		stage5(10)(20) <= stage6(10)(20);
		stage5(11)(20) <= stage6(11)(20);
	--n_col 21:
		stage5(0)(21) <= stage6(0)(21);
		stage5(1)(21) <= stage6(1)(21);
		stage5(2)(21) <= stage6(2)(21);
		stage5(3)(21) <= stage6(3)(21);
		stage5(4)(21) <= stage6(4)(21);
		stage5(5)(21) <= stage6(5)(21);
		stage5(6)(21) <= stage6(6)(21);
		stage5(7)(21) <= stage6(7)(21);
		stage5(8)(21) <= stage6(8)(21);
		stage5(9)(21) <= stage6(9)(21);
		stage5(10)(21) <= stage6(10)(21);
	--n_col 22:
		stage5(0)(22) <= stage6(0)(22);
		stage5(1)(22) <= stage6(1)(22);
		stage5(2)(22) <= stage6(2)(22);
		stage5(3)(22) <= stage6(3)(22);
		stage5(4)(22) <= stage6(4)(22);
		stage5(5)(22) <= stage6(5)(22);
		stage5(6)(22) <= stage6(6)(22);
		stage5(7)(22) <= stage6(7)(22);
		stage5(8)(22) <= stage6(8)(22);
		stage5(9)(22) <= stage6(9)(22);
		stage5(10)(22) <= stage6(10)(22);
		stage5(11)(22) <= stage6(11)(22);
		stage5(12)(22) <= stage6(12)(22);
	--n_col 23:
		stage5(0)(23) <= stage6(0)(23);
		stage5(1)(23) <= stage6(1)(23);
		stage5(2)(23) <= stage6(2)(23);
		stage5(3)(23) <= stage6(3)(23);
		stage5(4)(23) <= stage6(4)(23);
		stage5(5)(23) <= stage6(5)(23);
		stage5(6)(23) <= stage6(6)(23);
		stage5(7)(23) <= stage6(7)(23);
		stage5(8)(23) <= stage6(8)(23);
		stage5(9)(23) <= stage6(9)(23);
		stage5(10)(23) <= stage6(10)(23);
		stage5(11)(23) <= stage6(11)(23);
	--n_col 24:
		HA_6_24 : HA port map (stage6(0)(24), stage6(1)(24), stage5(0)(24), stage5(0)(25));
		stage5(1)(24) <= stage6(2)(24);
		stage5(2)(24) <= stage6(3)(24);
		stage5(3)(24) <= stage6(4)(24);
		stage5(4)(24) <= stage6(5)(24);
		stage5(5)(24) <= stage6(6)(24);
		stage5(6)(24) <= stage6(7)(24);
		stage5(7)(24) <= stage6(8)(24);
		stage5(8)(24) <= stage6(9)(24);
		stage5(9)(24) <= stage6(10)(24);
		stage5(10)(24) <= stage6(11)(24);
		stage5(11)(24) <= stage6(12)(24);
		stage5(12)(24) <= stage6(13)(24);
	--n_col 25:
		HA_6_25 : HA port map (stage6(0)(25), stage6(1)(25), stage5(1)(25), stage5(0)(26));
		stage5(2)(25) <= stage6(2)(25);
		stage5(3)(25) <= stage6(3)(25);
		stage5(4)(25) <= stage6(4)(25);
		stage5(5)(25) <= stage6(5)(25);
		stage5(6)(25) <= stage6(6)(25);
		stage5(7)(25) <= stage6(7)(25);
		stage5(8)(25) <= stage6(8)(25);
		stage5(9)(25) <= stage6(9)(25);
		stage5(10)(25) <= stage6(10)(25);
		stage5(11)(25) <= stage6(11)(25);
		stage5(12)(25) <= stage6(12)(25);
	--n_col 26:
		FA_6_26_0 : FA port map (stage6(0)(26), stage6(1)(26), stage6(2)(26), stage5(1)(26), stage5(0)(27));
		HA_6_26 : HA port map (stage6(3)(26), stage6(4)(26), stage5(2)(26), stage5(1)(27));
		stage5(3)(26) <= stage6(5)(26);
		stage5(4)(26) <= stage6(6)(26);
		stage5(5)(26) <= stage6(7)(26);
		stage5(6)(26) <= stage6(8)(26);
		stage5(7)(26) <= stage6(9)(26);
		stage5(8)(26) <= stage6(10)(26);
		stage5(9)(26) <= stage6(11)(26);
		stage5(10)(26) <= stage6(12)(26);
		stage5(11)(26) <= stage6(13)(26);
		stage5(12)(26) <= stage6(14)(26);
	--n_col 27:
		FA_6_27_0 : FA port map (stage6(0)(27), stage6(1)(27), stage6(2)(27), stage5(2)(27), stage5(0)(28));
		HA_6_27 : HA port map (stage6(3)(27), stage6(4)(27), stage5(3)(27), stage5(1)(28));
		stage5(4)(27) <= stage6(5)(27);
		stage5(5)(27) <= stage6(6)(27);
		stage5(6)(27) <= stage6(7)(27);
		stage5(7)(27) <= stage6(8)(27);
		stage5(8)(27) <= stage6(9)(27);
		stage5(9)(27) <= stage6(10)(27);
		stage5(10)(27) <= stage6(11)(27);
		stage5(11)(27) <= stage6(12)(27);
		stage5(12)(27) <= stage6(13)(27);
	--n_col 28:
		FA_6_28_0 : FA port map (stage6(0)(28), stage6(1)(28), stage6(2)(28), stage5(2)(28), stage5(0)(29));
		FA_6_28_1 : FA port map (stage6(3)(28), stage6(4)(28), stage6(5)(28), stage5(3)(28), stage5(1)(29));
		HA_6_28 : HA port map (stage6(6)(28), stage6(7)(28), stage5(4)(28), stage5(2)(29));
		stage5(5)(28) <= stage6(8)(28);
		stage5(6)(28) <= stage6(9)(28);
		stage5(7)(28) <= stage6(10)(28);
		stage5(8)(28) <= stage6(11)(28);
		stage5(9)(28) <= stage6(12)(28);
		stage5(10)(28) <= stage6(13)(28);
		stage5(11)(28) <= stage6(14)(28);
		stage5(12)(28) <= stage6(15)(28);
	--n_col 29:
		FA_6_29_0 : FA port map (stage6(0)(29), stage6(1)(29), stage6(2)(29), stage5(3)(29), stage5(0)(30));
		FA_6_29_1 : FA port map (stage6(3)(29), stage6(4)(29), stage6(5)(29), stage5(4)(29), stage5(1)(30));
		HA_6_29 : HA port map (stage6(6)(29), stage6(7)(29), stage5(5)(29), stage5(2)(30));
		stage5(6)(29) <= stage6(8)(29);
		stage5(7)(29) <= stage6(9)(29);
		stage5(8)(29) <= stage6(10)(29);
		stage5(9)(29) <= stage6(11)(29);
		stage5(10)(29) <= stage6(12)(29);
		stage5(11)(29) <= stage6(13)(29);
		stage5(12)(29) <= stage6(14)(29);
	--n_col 30:
		FA_6_30_0 : FA port map (stage6(0)(30), stage6(1)(30), stage6(2)(30), stage5(3)(30), stage5(0)(31));
		FA_6_30_1 : FA port map (stage6(3)(30), stage6(4)(30), stage6(5)(30), stage5(4)(30), stage5(1)(31));
		FA_6_30_2 : FA port map (stage6(6)(30), stage6(7)(30), stage6(8)(30), stage5(5)(30), stage5(2)(31));
		HA_6_30 : HA port map (stage6(9)(30), stage6(10)(30), stage5(6)(30), stage5(3)(31));
		stage5(7)(30) <= stage6(11)(30);
		stage5(8)(30) <= stage6(12)(30);
		stage5(9)(30) <= stage6(13)(30);
		stage5(10)(30) <= stage6(14)(30);
		stage5(11)(30) <= stage6(15)(30);
		stage5(12)(30) <= stage6(16)(30);
	--n_col 31:
		FA_6_31_0 : FA port map (stage6(0)(31), stage6(1)(31), stage6(2)(31), stage5(4)(31), stage5(0)(32));
		FA_6_31_1 : FA port map (stage6(3)(31), stage6(4)(31), stage6(5)(31), stage5(5)(31), stage5(1)(32));
		FA_6_31_2 : FA port map (stage6(6)(31), stage6(7)(31), stage6(8)(31), stage5(6)(31), stage5(2)(32));
		HA_6_31 : HA port map (stage6(9)(31), stage6(10)(31), stage5(7)(31), stage5(3)(32));
		stage5(8)(31) <= stage6(11)(31);
		stage5(9)(31) <= stage6(12)(31);
		stage5(10)(31) <= stage6(13)(31);
		stage5(11)(31) <= stage6(14)(31);
		stage5(12)(31) <= stage6(15)(31);
	--n_col 32:
		FA_6_32_0 : FA port map (stage6(0)(32), stage6(1)(32), stage6(2)(32), stage5(4)(32), stage5(0)(33));
		FA_6_32_1 : FA port map (stage6(3)(32), stage6(4)(32), stage6(5)(32), stage5(5)(32), stage5(1)(33));
		FA_6_32_2 : FA port map (stage6(6)(32), stage6(7)(32), stage6(8)(32), stage5(6)(32), stage5(2)(33));
		FA_6_32_3 : FA port map (stage6(9)(32), stage6(10)(32), stage6(11)(32), stage5(7)(32), stage5(3)(33));
		stage5(8)(32) <= stage6(12)(32);
		stage5(9)(32) <= stage6(13)(32);
		stage5(10)(32) <= stage6(14)(32);
		stage5(11)(32) <= stage6(15)(32);
		stage5(12)(32) <= stage6(16)(32);
	--n_col 33:
		FA_6_33_0 : FA port map (stage6(0)(33), stage6(1)(33), stage6(2)(33), stage5(4)(33), stage5(0)(34));
		FA_6_33_1 : FA port map (stage6(3)(33), stage6(4)(33), stage6(5)(33), stage5(5)(33), stage5(1)(34));
		FA_6_33_2 : FA port map (stage6(6)(33), stage6(7)(33), stage6(8)(33), stage5(6)(33), stage5(2)(34));
		FA_6_33_3 : FA port map (stage6(9)(33), stage6(10)(33), stage6(11)(33), stage5(7)(33), stage5(3)(34));
		stage5(8)(33) <= stage6(12)(33);
		stage5(9)(33) <= stage6(13)(33);
		stage5(10)(33) <= stage6(14)(33);
		stage5(11)(33) <= stage6(15)(33);
		stage5(12)(33) <= stage6(16)(33);
	--n_col 34:
		FA_6_34_0 : FA port map (stage6(0)(34), stage6(1)(34), stage6(2)(34), stage5(4)(34), stage5(0)(35));
		FA_6_34_1 : FA port map (stage6(3)(34), stage6(4)(34), stage6(5)(34), stage5(5)(34), stage5(1)(35));
		FA_6_34_2 : FA port map (stage6(6)(34), stage6(7)(34), stage6(8)(34), stage5(6)(34), stage5(2)(35));
		FA_6_34_3 : FA port map (stage6(9)(34), stage6(10)(34), stage6(11)(34), stage5(7)(34), stage5(3)(35));
		stage5(8)(34) <= stage6(12)(34);
		stage5(9)(34) <= stage6(13)(34);
		stage5(10)(34) <= stage6(14)(34);
		stage5(11)(34) <= stage6(15)(34);
		stage5(12)(34) <= stage6(16)(34);
	--n_col 35:
		FA_6_35_0 : FA port map (stage6(0)(35), stage6(1)(35), stage6(2)(35), stage5(4)(35), stage5(0)(36));
		FA_6_35_1 : FA port map (stage6(3)(35), stage6(4)(35), stage6(5)(35), stage5(5)(35), stage5(1)(36));
		FA_6_35_2 : FA port map (stage6(6)(35), stage6(7)(35), stage6(8)(35), stage5(6)(35), stage5(2)(36));
		FA_6_35_3 : FA port map (stage6(9)(35), stage6(10)(35), stage6(11)(35), stage5(7)(35), stage5(3)(36));
		stage5(8)(35) <= stage6(12)(35);
		stage5(9)(35) <= stage6(13)(35);
		stage5(10)(35) <= stage6(14)(35);
		stage5(11)(35) <= stage6(15)(35);
		stage5(12)(35) <= stage6(16)(35);
	--n_col 36:
		FA_6_36_0 : FA port map (stage6(1)(36), stage6(2)(36), stage6(3)(36), stage5(4)(36), stage5(0)(37));
		FA_6_36_1 : FA port map (stage6(4)(36), stage6(5)(36), stage6(6)(36), stage5(5)(36), stage5(1)(37));
		FA_6_36_2 : FA port map (stage6(7)(36), stage6(8)(36), stage6(9)(36), stage5(6)(36), stage5(2)(37));
		HA_6_36 : HA port map (stage6(10)(36), stage6(11)(36), stage5(7)(36), stage5(3)(37));
		stage5(8)(36) <= stage6(12)(36);
		stage5(9)(36) <= stage6(13)(36);
		stage5(10)(36) <= stage6(14)(36);
		stage5(11)(36) <= stage6(15)(36);
		stage5(12)(36) <= stage6(16)(36);
	--n_col 37:
		FA_6_37_0 : FA port map (stage6(2)(37), stage6(3)(37), stage6(4)(37), stage5(4)(37), stage5(0)(38));
		FA_6_37_1 : FA port map (stage6(5)(37), stage6(6)(37), stage6(7)(37), stage5(5)(37), stage5(1)(38));
		FA_6_37_2 : FA port map (stage6(8)(37), stage6(9)(37), stage6(10)(37), stage5(6)(37), stage5(2)(38));
		stage5(7)(37) <= stage6(11)(37);
		stage5(8)(37) <= stage6(12)(37);
		stage5(9)(37) <= stage6(13)(37);
		stage5(10)(37) <= stage6(14)(37);
		stage5(11)(37) <= stage6(15)(37);
		stage5(12)(37) <= stage6(16)(37);
	--n_col 38:
		FA_6_38_0 : FA port map (stage6(2)(38), stage6(3)(38), stage6(4)(38), stage5(3)(38), stage5(0)(39));
		FA_6_38_1 : FA port map (stage6(5)(38), stage6(6)(38), stage6(7)(38), stage5(4)(38), stage5(1)(39));
		HA_6_38 : HA port map (stage6(8)(38), stage6(9)(38), stage5(5)(38), stage5(2)(39));
		stage5(6)(38) <= stage6(10)(38);
		stage5(7)(38) <= stage6(11)(38);
		stage5(8)(38) <= stage6(12)(38);
		stage5(9)(38) <= stage6(13)(38);
		stage5(10)(38) <= stage6(14)(38);
		stage5(11)(38) <= stage6(15)(38);
		stage5(12)(38) <= stage6(16)(38);
	--n_col 39:
		FA_6_39_0 : FA port map (stage6(3)(39), stage6(4)(39), stage6(5)(39), stage5(3)(39), stage5(0)(40));
		FA_6_39_1 : FA port map (stage6(6)(39), stage6(7)(39), stage6(8)(39), stage5(4)(39), stage5(1)(40));
		stage5(5)(39) <= stage6(9)(39);
		stage5(6)(39) <= stage6(10)(39);
		stage5(7)(39) <= stage6(11)(39);
		stage5(8)(39) <= stage6(12)(39);
		stage5(9)(39) <= stage6(13)(39);
		stage5(10)(39) <= stage6(14)(39);
		stage5(11)(39) <= stage6(15)(39);
		stage5(12)(39) <= stage6(16)(39);
	--n_col 40:
		FA_6_40_0 : FA port map (stage6(3)(40), stage6(4)(40), stage6(5)(40), stage5(2)(40), stage5(0)(41));
		HA_6_40 : HA port map (stage6(6)(40), stage6(7)(40), stage5(3)(40), stage5(1)(41));
		stage5(4)(40) <= stage6(8)(40);
		stage5(5)(40) <= stage6(9)(40);
		stage5(6)(40) <= stage6(10)(40);
		stage5(7)(40) <= stage6(11)(40);
		stage5(8)(40) <= stage6(12)(40);
		stage5(9)(40) <= stage6(13)(40);
		stage5(10)(40) <= stage6(14)(40);
		stage5(11)(40) <= stage6(15)(40);
		stage5(12)(40) <= stage6(16)(40);
	--n_col 41:
		FA_6_41_0 : FA port map (stage6(4)(41), stage6(5)(41), stage6(6)(41), stage5(2)(41), stage5(0)(42));
		stage5(3)(41) <= stage6(7)(41);
		stage5(4)(41) <= stage6(8)(41);
		stage5(5)(41) <= stage6(9)(41);
		stage5(6)(41) <= stage6(10)(41);
		stage5(7)(41) <= stage6(11)(41);
		stage5(8)(41) <= stage6(12)(41);
		stage5(9)(41) <= stage6(13)(41);
		stage5(10)(41) <= stage6(14)(41);
		stage5(11)(41) <= stage6(15)(41);
		stage5(12)(41) <= stage6(16)(41);
	--n_col 42:
		HA_6_42 : HA port map (stage6(4)(42), stage6(5)(42), stage5(1)(42), stage5(0)(43));
		stage5(2)(42) <= stage6(6)(42);
		stage5(3)(42) <= stage6(7)(42);
		stage5(4)(42) <= stage6(8)(42);
		stage5(5)(42) <= stage6(9)(42);
		stage5(6)(42) <= stage6(10)(42);
		stage5(7)(42) <= stage6(11)(42);
		stage5(8)(42) <= stage6(12)(42);
		stage5(9)(42) <= stage6(13)(42);
		stage5(10)(42) <= stage6(14)(42);
		stage5(11)(42) <= stage6(15)(42);
		stage5(12)(42) <= stage6(16)(42);
	--n_col 43:
		stage5(1)(43) <= stage6(5)(43);
		stage5(2)(43) <= stage6(6)(43);
		stage5(3)(43) <= stage6(7)(43);
		stage5(4)(43) <= stage6(8)(43);
		stage5(5)(43) <= stage6(9)(43);
		stage5(6)(43) <= stage6(10)(43);
		stage5(7)(43) <= stage6(11)(43);
		stage5(8)(43) <= stage6(12)(43);
		stage5(9)(43) <= stage6(13)(43);
		stage5(10)(43) <= stage6(14)(43);
		stage5(11)(43) <= stage6(15)(43);
		stage5(12)(43) <= stage6(16)(43);
	--n_col 44:
		stage5(0)(44) <= stage6(5)(44);
		stage5(1)(44) <= stage6(6)(44);
		stage5(2)(44) <= stage6(7)(44);
		stage5(3)(44) <= stage6(8)(44);
		stage5(4)(44) <= stage6(9)(44);
		stage5(5)(44) <= stage6(10)(44);
		stage5(6)(44) <= stage6(11)(44);
		stage5(7)(44) <= stage6(12)(44);
		stage5(8)(44) <= stage6(13)(44);
		stage5(9)(44) <= stage6(14)(44);
		stage5(10)(44) <= stage6(15)(44);
		stage5(11)(44) <= stage6(16)(44);
	--n_col 45:
		stage5(0)(45) <= stage6(6)(45);
		stage5(1)(45) <= stage6(7)(45);
		stage5(2)(45) <= stage6(8)(45);
		stage5(3)(45) <= stage6(9)(45);
		stage5(4)(45) <= stage6(10)(45);
		stage5(5)(45) <= stage6(11)(45);
		stage5(6)(45) <= stage6(12)(45);
		stage5(7)(45) <= stage6(13)(45);
		stage5(8)(45) <= stage6(14)(45);
		stage5(9)(45) <= stage6(15)(45);
		stage5(10)(45) <= stage6(16)(45);
	--n_col 46:
		stage5(0)(46) <= stage6(6)(46);
		stage5(1)(46) <= stage6(7)(46);
		stage5(2)(46) <= stage6(8)(46);
		stage5(3)(46) <= stage6(9)(46);
		stage5(4)(46) <= stage6(10)(46);
		stage5(5)(46) <= stage6(11)(46);
		stage5(6)(46) <= stage6(12)(46);
		stage5(7)(46) <= stage6(13)(46);
		stage5(8)(46) <= stage6(14)(46);
		stage5(9)(46) <= stage6(15)(46);
		stage5(10)(46) <= stage6(16)(46);
	--n_col 47:
		stage5(0)(47) <= stage6(7)(47);
		stage5(1)(47) <= stage6(8)(47);
		stage5(2)(47) <= stage6(9)(47);
		stage5(3)(47) <= stage6(10)(47);
		stage5(4)(47) <= stage6(11)(47);
		stage5(5)(47) <= stage6(12)(47);
		stage5(6)(47) <= stage6(13)(47);
		stage5(7)(47) <= stage6(14)(47);
		stage5(8)(47) <= stage6(15)(47);
		stage5(9)(47) <= stage6(16)(47);
	--n_col 48:
		stage5(0)(48) <= stage6(7)(48);
		stage5(1)(48) <= stage6(8)(48);
		stage5(2)(48) <= stage6(9)(48);
		stage5(3)(48) <= stage6(10)(48);
		stage5(4)(48) <= stage6(11)(48);
		stage5(5)(48) <= stage6(12)(48);
		stage5(6)(48) <= stage6(13)(48);
		stage5(7)(48) <= stage6(14)(48);
		stage5(8)(48) <= stage6(15)(48);
		stage5(9)(48) <= stage6(16)(48);
	--n_col 49:
		stage5(0)(49) <= stage6(8)(49);
		stage5(1)(49) <= stage6(9)(49);
		stage5(2)(49) <= stage6(10)(49);
		stage5(3)(49) <= stage6(11)(49);
		stage5(4)(49) <= stage6(12)(49);
		stage5(5)(49) <= stage6(13)(49);
		stage5(6)(49) <= stage6(14)(49);
		stage5(7)(49) <= stage6(15)(49);
		stage5(8)(49) <= stage6(16)(49);
	--n_col 50:
		stage5(0)(50) <= stage6(8)(50);
		stage5(1)(50) <= stage6(9)(50);
		stage5(2)(50) <= stage6(10)(50);
		stage5(3)(50) <= stage6(11)(50);
		stage5(4)(50) <= stage6(12)(50);
		stage5(5)(50) <= stage6(13)(50);
		stage5(6)(50) <= stage6(14)(50);
		stage5(7)(50) <= stage6(15)(50);
		stage5(8)(50) <= stage6(16)(50);
	--n_col 51:
		stage5(0)(51) <= stage6(9)(51);
		stage5(1)(51) <= stage6(10)(51);
		stage5(2)(51) <= stage6(11)(51);
		stage5(3)(51) <= stage6(12)(51);
		stage5(4)(51) <= stage6(13)(51);
		stage5(5)(51) <= stage6(14)(51);
		stage5(6)(51) <= stage6(15)(51);
		stage5(7)(51) <= stage6(16)(51);
	--n_col 52:
		stage5(0)(52) <= stage6(9)(52);
		stage5(1)(52) <= stage6(10)(52);
		stage5(2)(52) <= stage6(11)(52);
		stage5(3)(52) <= stage6(12)(52);
		stage5(4)(52) <= stage6(13)(52);
		stage5(5)(52) <= stage6(14)(52);
		stage5(6)(52) <= stage6(15)(52);
		stage5(7)(52) <= stage6(16)(52);
	--n_col 53:
		stage5(0)(53) <= stage6(10)(53);
		stage5(1)(53) <= stage6(11)(53);
		stage5(2)(53) <= stage6(12)(53);
		stage5(3)(53) <= stage6(13)(53);
		stage5(4)(53) <= stage6(14)(53);
		stage5(5)(53) <= stage6(15)(53);
		stage5(6)(53) <= stage6(16)(53);
	--n_col 54:
		stage5(0)(54) <= stage6(10)(54);
		stage5(1)(54) <= stage6(11)(54);
		stage5(2)(54) <= stage6(12)(54);
		stage5(3)(54) <= stage6(13)(54);
		stage5(4)(54) <= stage6(14)(54);
		stage5(5)(54) <= stage6(15)(54);
		stage5(6)(54) <= stage6(16)(54);
	--n_col 55:
		stage5(0)(55) <= stage6(11)(55);
		stage5(1)(55) <= stage6(12)(55);
		stage5(2)(55) <= stage6(13)(55);
		stage5(3)(55) <= stage6(14)(55);
		stage5(4)(55) <= stage6(15)(55);
		stage5(5)(55) <= stage6(16)(55);
	--n_col 56:
		stage5(0)(56) <= stage6(11)(56);
		stage5(1)(56) <= stage6(12)(56);
		stage5(2)(56) <= stage6(13)(56);
		stage5(3)(56) <= stage6(14)(56);
		stage5(4)(56) <= stage6(15)(56);
		stage5(5)(56) <= stage6(16)(56);
	--n_col 57:
		stage5(0)(57) <= stage6(12)(57);
		stage5(1)(57) <= stage6(13)(57);
		stage5(2)(57) <= stage6(14)(57);
		stage5(3)(57) <= stage6(15)(57);
		stage5(4)(57) <= stage6(16)(57);
	--n_col 58:
		stage5(0)(58) <= stage6(12)(58);
		stage5(1)(58) <= stage6(13)(58);
		stage5(2)(58) <= stage6(14)(58);
		stage5(3)(58) <= stage6(15)(58);
		stage5(4)(58) <= stage6(16)(58);
	--n_col 59:
		stage5(0)(59) <= stage6(13)(59);
		stage5(1)(59) <= stage6(14)(59);
		stage5(2)(59) <= stage6(15)(59);
		stage5(3)(59) <= stage6(16)(59);
	--n_col 60:
		stage5(0)(60) <= stage6(13)(60);
		stage5(1)(60) <= stage6(14)(60);
		stage5(2)(60) <= stage6(15)(60);
		stage5(3)(60) <= stage6(16)(60);
	--n_col 61:
		stage5(0)(61) <= stage6(14)(61);
		stage5(1)(61) <= stage6(15)(61);
		stage5(2)(61) <= stage6(16)(61);
	--n_col 62:
		stage5(0)(62) <= stage6(14)(62);
		stage5(1)(62) <= stage6(15)(62);
		stage5(2)(62) <= stage6(16)(62);
	--n_col 63:
		stage5(0)(63) <= stage6(15)(63);
		stage5(1)(63) <= stage6(16)(63);

	--stage 5:

	--n_col 0:
		stage4(0)(0) <= stage5(0)(0);
		stage4(1)(0) <= stage5(1)(0);
	--n_col 1:
		stage4(0)(1) <= stage5(0)(1);
	--n_col 2:
		stage4(0)(2) <= stage5(0)(2);
		stage4(1)(2) <= stage5(1)(2);
		stage4(2)(2) <= stage5(2)(2);
	--n_col 3:
		stage4(0)(3) <= stage5(0)(3);
		stage4(1)(3) <= stage5(1)(3);
	--n_col 4:
		stage4(0)(4) <= stage5(0)(4);
		stage4(1)(4) <= stage5(1)(4);
		stage4(2)(4) <= stage5(2)(4);
		stage4(3)(4) <= stage5(3)(4);
	--n_col 5:
		stage4(0)(5) <= stage5(0)(5);
		stage4(1)(5) <= stage5(1)(5);
		stage4(2)(5) <= stage5(2)(5);
	--n_col 6:
		stage4(0)(6) <= stage5(0)(6);
		stage4(1)(6) <= stage5(1)(6);
		stage4(2)(6) <= stage5(2)(6);
		stage4(3)(6) <= stage5(3)(6);
		stage4(4)(6) <= stage5(4)(6);
	--n_col 7:
		stage4(0)(7) <= stage5(0)(7);
		stage4(1)(7) <= stage5(1)(7);
		stage4(2)(7) <= stage5(2)(7);
		stage4(3)(7) <= stage5(3)(7);
	--n_col 8:
		stage4(0)(8) <= stage5(0)(8);
		stage4(1)(8) <= stage5(1)(8);
		stage4(2)(8) <= stage5(2)(8);
		stage4(3)(8) <= stage5(3)(8);
		stage4(4)(8) <= stage5(4)(8);
		stage4(5)(8) <= stage5(5)(8);
	--n_col 9:
		stage4(0)(9) <= stage5(0)(9);
		stage4(1)(9) <= stage5(1)(9);
		stage4(2)(9) <= stage5(2)(9);
		stage4(3)(9) <= stage5(3)(9);
		stage4(4)(9) <= stage5(4)(9);
	--n_col 10:
		stage4(0)(10) <= stage5(0)(10);
		stage4(1)(10) <= stage5(1)(10);
		stage4(2)(10) <= stage5(2)(10);
		stage4(3)(10) <= stage5(3)(10);
		stage4(4)(10) <= stage5(4)(10);
		stage4(5)(10) <= stage5(5)(10);
		stage4(6)(10) <= stage5(6)(10);
	--n_col 11:
		stage4(0)(11) <= stage5(0)(11);
		stage4(1)(11) <= stage5(1)(11);
		stage4(2)(11) <= stage5(2)(11);
		stage4(3)(11) <= stage5(3)(11);
		stage4(4)(11) <= stage5(4)(11);
		stage4(5)(11) <= stage5(5)(11);
	--n_col 12:
		stage4(0)(12) <= stage5(0)(12);
		stage4(1)(12) <= stage5(1)(12);
		stage4(2)(12) <= stage5(2)(12);
		stage4(3)(12) <= stage5(3)(12);
		stage4(4)(12) <= stage5(4)(12);
		stage4(5)(12) <= stage5(5)(12);
		stage4(6)(12) <= stage5(6)(12);
		stage4(7)(12) <= stage5(7)(12);
	--n_col 13:
		stage4(0)(13) <= stage5(0)(13);
		stage4(1)(13) <= stage5(1)(13);
		stage4(2)(13) <= stage5(2)(13);
		stage4(3)(13) <= stage5(3)(13);
		stage4(4)(13) <= stage5(4)(13);
		stage4(5)(13) <= stage5(5)(13);
		stage4(6)(13) <= stage5(6)(13);
	--n_col 14:
		stage4(0)(14) <= stage5(0)(14);
		stage4(1)(14) <= stage5(1)(14);
		stage4(2)(14) <= stage5(2)(14);
		stage4(3)(14) <= stage5(3)(14);
		stage4(4)(14) <= stage5(4)(14);
		stage4(5)(14) <= stage5(5)(14);
		stage4(6)(14) <= stage5(6)(14);
		stage4(7)(14) <= stage5(7)(14);
		stage4(8)(14) <= stage5(8)(14);
	--n_col 15:
		stage4(0)(15) <= stage5(0)(15);
		stage4(1)(15) <= stage5(1)(15);
		stage4(2)(15) <= stage5(2)(15);
		stage4(3)(15) <= stage5(3)(15);
		stage4(4)(15) <= stage5(4)(15);
		stage4(5)(15) <= stage5(5)(15);
		stage4(6)(15) <= stage5(6)(15);
		stage4(7)(15) <= stage5(7)(15);
	--n_col 16:
		HA_5_16 : HA port map (stage5(0)(16), stage5(1)(16), stage4(0)(16), stage4(0)(17));
		stage4(1)(16) <= stage5(2)(16);
		stage4(2)(16) <= stage5(3)(16);
		stage4(3)(16) <= stage5(4)(16);
		stage4(4)(16) <= stage5(5)(16);
		stage4(5)(16) <= stage5(6)(16);
		stage4(6)(16) <= stage5(7)(16);
		stage4(7)(16) <= stage5(8)(16);
		stage4(8)(16) <= stage5(9)(16);
	--n_col 17:
		HA_5_17 : HA port map (stage5(0)(17), stage5(1)(17), stage4(1)(17), stage4(0)(18));
		stage4(2)(17) <= stage5(2)(17);
		stage4(3)(17) <= stage5(3)(17);
		stage4(4)(17) <= stage5(4)(17);
		stage4(5)(17) <= stage5(5)(17);
		stage4(6)(17) <= stage5(6)(17);
		stage4(7)(17) <= stage5(7)(17);
		stage4(8)(17) <= stage5(8)(17);
	--n_col 18:
		FA_5_18_0 : FA port map (stage5(0)(18), stage5(1)(18), stage5(2)(18), stage4(1)(18), stage4(0)(19));
		HA_5_18 : HA port map (stage5(3)(18), stage5(4)(18), stage4(2)(18), stage4(1)(19));
		stage4(3)(18) <= stage5(5)(18);
		stage4(4)(18) <= stage5(6)(18);
		stage4(5)(18) <= stage5(7)(18);
		stage4(6)(18) <= stage5(8)(18);
		stage4(7)(18) <= stage5(9)(18);
		stage4(8)(18) <= stage5(10)(18);
	--n_col 19:
		FA_5_19_0 : FA port map (stage5(0)(19), stage5(1)(19), stage5(2)(19), stage4(2)(19), stage4(0)(20));
		HA_5_19 : HA port map (stage5(3)(19), stage5(4)(19), stage4(3)(19), stage4(1)(20));
		stage4(4)(19) <= stage5(5)(19);
		stage4(5)(19) <= stage5(6)(19);
		stage4(6)(19) <= stage5(7)(19);
		stage4(7)(19) <= stage5(8)(19);
		stage4(8)(19) <= stage5(9)(19);
	--n_col 20:
		FA_5_20_0 : FA port map (stage5(0)(20), stage5(1)(20), stage5(2)(20), stage4(2)(20), stage4(0)(21));
		FA_5_20_1 : FA port map (stage5(3)(20), stage5(4)(20), stage5(5)(20), stage4(3)(20), stage4(1)(21));
		HA_5_20 : HA port map (stage5(6)(20), stage5(7)(20), stage4(4)(20), stage4(2)(21));
		stage4(5)(20) <= stage5(8)(20);
		stage4(6)(20) <= stage5(9)(20);
		stage4(7)(20) <= stage5(10)(20);
		stage4(8)(20) <= stage5(11)(20);
	--n_col 21:
		FA_5_21_0 : FA port map (stage5(0)(21), stage5(1)(21), stage5(2)(21), stage4(3)(21), stage4(0)(22));
		FA_5_21_1 : FA port map (stage5(3)(21), stage5(4)(21), stage5(5)(21), stage4(4)(21), stage4(1)(22));
		HA_5_21 : HA port map (stage5(6)(21), stage5(7)(21), stage4(5)(21), stage4(2)(22));
		stage4(6)(21) <= stage5(8)(21);
		stage4(7)(21) <= stage5(9)(21);
		stage4(8)(21) <= stage5(10)(21);
	--n_col 22:
		FA_5_22_0 : FA port map (stage5(0)(22), stage5(1)(22), stage5(2)(22), stage4(3)(22), stage4(0)(23));
		FA_5_22_1 : FA port map (stage5(3)(22), stage5(4)(22), stage5(5)(22), stage4(4)(22), stage4(1)(23));
		FA_5_22_2 : FA port map (stage5(6)(22), stage5(7)(22), stage5(8)(22), stage4(5)(22), stage4(2)(23));
		HA_5_22 : HA port map (stage5(9)(22), stage5(10)(22), stage4(6)(22), stage4(3)(23));
		stage4(7)(22) <= stage5(11)(22);
		stage4(8)(22) <= stage5(12)(22);
	--n_col 23:
		FA_5_23_0 : FA port map (stage5(0)(23), stage5(1)(23), stage5(2)(23), stage4(4)(23), stage4(0)(24));
		FA_5_23_1 : FA port map (stage5(3)(23), stage5(4)(23), stage5(5)(23), stage4(5)(23), stage4(1)(24));
		FA_5_23_2 : FA port map (stage5(6)(23), stage5(7)(23), stage5(8)(23), stage4(6)(23), stage4(2)(24));
		HA_5_23 : HA port map (stage5(9)(23), stage5(10)(23), stage4(7)(23), stage4(3)(24));
		stage4(8)(23) <= stage5(11)(23);
	--n_col 24:
		FA_5_24_0 : FA port map (stage5(0)(24), stage5(1)(24), stage5(2)(24), stage4(4)(24), stage4(0)(25));
		FA_5_24_1 : FA port map (stage5(3)(24), stage5(4)(24), stage5(5)(24), stage4(5)(24), stage4(1)(25));
		FA_5_24_2 : FA port map (stage5(6)(24), stage5(7)(24), stage5(8)(24), stage4(6)(24), stage4(2)(25));
		FA_5_24_3 : FA port map (stage5(9)(24), stage5(10)(24), stage5(11)(24), stage4(7)(24), stage4(3)(25));
		stage4(8)(24) <= stage5(12)(24);
	--n_col 25:
		FA_5_25_0 : FA port map (stage5(0)(25), stage5(1)(25), stage5(2)(25), stage4(4)(25), stage4(0)(26));
		FA_5_25_1 : FA port map (stage5(3)(25), stage5(4)(25), stage5(5)(25), stage4(5)(25), stage4(1)(26));
		FA_5_25_2 : FA port map (stage5(6)(25), stage5(7)(25), stage5(8)(25), stage4(6)(25), stage4(2)(26));
		FA_5_25_3 : FA port map (stage5(9)(25), stage5(10)(25), stage5(11)(25), stage4(7)(25), stage4(3)(26));
		stage4(8)(25) <= stage5(12)(25);
	--n_col 26:
		FA_5_26_0 : FA port map (stage5(0)(26), stage5(1)(26), stage5(2)(26), stage4(4)(26), stage4(0)(27));
		FA_5_26_1 : FA port map (stage5(3)(26), stage5(4)(26), stage5(5)(26), stage4(5)(26), stage4(1)(27));
		FA_5_26_2 : FA port map (stage5(6)(26), stage5(7)(26), stage5(8)(26), stage4(6)(26), stage4(2)(27));
		FA_5_26_3 : FA port map (stage5(9)(26), stage5(10)(26), stage5(11)(26), stage4(7)(26), stage4(3)(27));
		stage4(8)(26) <= stage5(12)(26);
	--n_col 27:
		FA_5_27_0 : FA port map (stage5(0)(27), stage5(1)(27), stage5(2)(27), stage4(4)(27), stage4(0)(28));
		FA_5_27_1 : FA port map (stage5(3)(27), stage5(4)(27), stage5(5)(27), stage4(5)(27), stage4(1)(28));
		FA_5_27_2 : FA port map (stage5(6)(27), stage5(7)(27), stage5(8)(27), stage4(6)(27), stage4(2)(28));
		FA_5_27_3 : FA port map (stage5(9)(27), stage5(10)(27), stage5(11)(27), stage4(7)(27), stage4(3)(28));
		stage4(8)(27) <= stage5(12)(27);
	--n_col 28:
		FA_5_28_0 : FA port map (stage5(0)(28), stage5(1)(28), stage5(2)(28), stage4(4)(28), stage4(0)(29));
		FA_5_28_1 : FA port map (stage5(3)(28), stage5(4)(28), stage5(5)(28), stage4(5)(28), stage4(1)(29));
		FA_5_28_2 : FA port map (stage5(6)(28), stage5(7)(28), stage5(8)(28), stage4(6)(28), stage4(2)(29));
		FA_5_28_3 : FA port map (stage5(9)(28), stage5(10)(28), stage5(11)(28), stage4(7)(28), stage4(3)(29));
		stage4(8)(28) <= stage5(12)(28);
	--n_col 29:
		FA_5_29_0 : FA port map (stage5(0)(29), stage5(1)(29), stage5(2)(29), stage4(4)(29), stage4(0)(30));
		FA_5_29_1 : FA port map (stage5(3)(29), stage5(4)(29), stage5(5)(29), stage4(5)(29), stage4(1)(30));
		FA_5_29_2 : FA port map (stage5(6)(29), stage5(7)(29), stage5(8)(29), stage4(6)(29), stage4(2)(30));
		FA_5_29_3 : FA port map (stage5(9)(29), stage5(10)(29), stage5(11)(29), stage4(7)(29), stage4(3)(30));
		stage4(8)(29) <= stage5(12)(29);
	--n_col 30:
		FA_5_30_0 : FA port map (stage5(0)(30), stage5(1)(30), stage5(2)(30), stage4(4)(30), stage4(0)(31));
		FA_5_30_1 : FA port map (stage5(3)(30), stage5(4)(30), stage5(5)(30), stage4(5)(30), stage4(1)(31));
		FA_5_30_2 : FA port map (stage5(6)(30), stage5(7)(30), stage5(8)(30), stage4(6)(30), stage4(2)(31));
		FA_5_30_3 : FA port map (stage5(9)(30), stage5(10)(30), stage5(11)(30), stage4(7)(30), stage4(3)(31));
		stage4(8)(30) <= stage5(12)(30);
	--n_col 31:
		FA_5_31_0 : FA port map (stage5(0)(31), stage5(1)(31), stage5(2)(31), stage4(4)(31), stage4(0)(32));
		FA_5_31_1 : FA port map (stage5(3)(31), stage5(4)(31), stage5(5)(31), stage4(5)(31), stage4(1)(32));
		FA_5_31_2 : FA port map (stage5(6)(31), stage5(7)(31), stage5(8)(31), stage4(6)(31), stage4(2)(32));
		FA_5_31_3 : FA port map (stage5(9)(31), stage5(10)(31), stage5(11)(31), stage4(7)(31), stage4(3)(32));
		stage4(8)(31) <= stage5(12)(31);
	--n_col 32:
		FA_5_32_0 : FA port map (stage5(0)(32), stage5(1)(32), stage5(2)(32), stage4(4)(32), stage4(0)(33));
		FA_5_32_1 : FA port map (stage5(3)(32), stage5(4)(32), stage5(5)(32), stage4(5)(32), stage4(1)(33));
		FA_5_32_2 : FA port map (stage5(6)(32), stage5(7)(32), stage5(8)(32), stage4(6)(32), stage4(2)(33));
		FA_5_32_3 : FA port map (stage5(9)(32), stage5(10)(32), stage5(11)(32), stage4(7)(32), stage4(3)(33));
		stage4(8)(32) <= stage5(12)(32);
	--n_col 33:
		FA_5_33_0 : FA port map (stage5(0)(33), stage5(1)(33), stage5(2)(33), stage4(4)(33), stage4(0)(34));
		FA_5_33_1 : FA port map (stage5(3)(33), stage5(4)(33), stage5(5)(33), stage4(5)(33), stage4(1)(34));
		FA_5_33_2 : FA port map (stage5(6)(33), stage5(7)(33), stage5(8)(33), stage4(6)(33), stage4(2)(34));
		FA_5_33_3 : FA port map (stage5(9)(33), stage5(10)(33), stage5(11)(33), stage4(7)(33), stage4(3)(34));
		stage4(8)(33) <= stage5(12)(33);
	--n_col 34:
		FA_5_34_0 : FA port map (stage5(0)(34), stage5(1)(34), stage5(2)(34), stage4(4)(34), stage4(0)(35));
		FA_5_34_1 : FA port map (stage5(3)(34), stage5(4)(34), stage5(5)(34), stage4(5)(34), stage4(1)(35));
		FA_5_34_2 : FA port map (stage5(6)(34), stage5(7)(34), stage5(8)(34), stage4(6)(34), stage4(2)(35));
		FA_5_34_3 : FA port map (stage5(9)(34), stage5(10)(34), stage5(11)(34), stage4(7)(34), stage4(3)(35));
		stage4(8)(34) <= stage5(12)(34);
	--n_col 35:
		FA_5_35_0 : FA port map (stage5(0)(35), stage5(1)(35), stage5(2)(35), stage4(4)(35), stage4(0)(36));
		FA_5_35_1 : FA port map (stage5(3)(35), stage5(4)(35), stage5(5)(35), stage4(5)(35), stage4(1)(36));
		FA_5_35_2 : FA port map (stage5(6)(35), stage5(7)(35), stage5(8)(35), stage4(6)(35), stage4(2)(36));
		FA_5_35_3 : FA port map (stage5(9)(35), stage5(10)(35), stage5(11)(35), stage4(7)(35), stage4(3)(36));
		stage4(8)(35) <= stage5(12)(35);
	--n_col 36:
		FA_5_36_0 : FA port map (stage5(0)(36), stage5(1)(36), stage5(2)(36), stage4(4)(36), stage4(0)(37));
		FA_5_36_1 : FA port map (stage5(3)(36), stage5(4)(36), stage5(5)(36), stage4(5)(36), stage4(1)(37));
		FA_5_36_2 : FA port map (stage5(6)(36), stage5(7)(36), stage5(8)(36), stage4(6)(36), stage4(2)(37));
		FA_5_36_3 : FA port map (stage5(9)(36), stage5(10)(36), stage5(11)(36), stage4(7)(36), stage4(3)(37));
		stage4(8)(36) <= stage5(12)(36);
	--n_col 37:
		FA_5_37_0 : FA port map (stage5(0)(37), stage5(1)(37), stage5(2)(37), stage4(4)(37), stage4(0)(38));
		FA_5_37_1 : FA port map (stage5(3)(37), stage5(4)(37), stage5(5)(37), stage4(5)(37), stage4(1)(38));
		FA_5_37_2 : FA port map (stage5(6)(37), stage5(7)(37), stage5(8)(37), stage4(6)(37), stage4(2)(38));
		FA_5_37_3 : FA port map (stage5(9)(37), stage5(10)(37), stage5(11)(37), stage4(7)(37), stage4(3)(38));
		stage4(8)(37) <= stage5(12)(37);
	--n_col 38:
		FA_5_38_0 : FA port map (stage5(0)(38), stage5(1)(38), stage5(2)(38), stage4(4)(38), stage4(0)(39));
		FA_5_38_1 : FA port map (stage5(3)(38), stage5(4)(38), stage5(5)(38), stage4(5)(38), stage4(1)(39));
		FA_5_38_2 : FA port map (stage5(6)(38), stage5(7)(38), stage5(8)(38), stage4(6)(38), stage4(2)(39));
		FA_5_38_3 : FA port map (stage5(9)(38), stage5(10)(38), stage5(11)(38), stage4(7)(38), stage4(3)(39));
		stage4(8)(38) <= stage5(12)(38);
	--n_col 39:
		FA_5_39_0 : FA port map (stage5(0)(39), stage5(1)(39), stage5(2)(39), stage4(4)(39), stage4(0)(40));
		FA_5_39_1 : FA port map (stage5(3)(39), stage5(4)(39), stage5(5)(39), stage4(5)(39), stage4(1)(40));
		FA_5_39_2 : FA port map (stage5(6)(39), stage5(7)(39), stage5(8)(39), stage4(6)(39), stage4(2)(40));
		FA_5_39_3 : FA port map (stage5(9)(39), stage5(10)(39), stage5(11)(39), stage4(7)(39), stage4(3)(40));
		stage4(8)(39) <= stage5(12)(39);
	--n_col 40:
		FA_5_40_0 : FA port map (stage5(0)(40), stage5(1)(40), stage5(2)(40), stage4(4)(40), stage4(0)(41));
		FA_5_40_1 : FA port map (stage5(3)(40), stage5(4)(40), stage5(5)(40), stage4(5)(40), stage4(1)(41));
		FA_5_40_2 : FA port map (stage5(6)(40), stage5(7)(40), stage5(8)(40), stage4(6)(40), stage4(2)(41));
		FA_5_40_3 : FA port map (stage5(9)(40), stage5(10)(40), stage5(11)(40), stage4(7)(40), stage4(3)(41));
		stage4(8)(40) <= stage5(12)(40);
	--n_col 41:
		FA_5_41_0 : FA port map (stage5(0)(41), stage5(1)(41), stage5(2)(41), stage4(4)(41), stage4(0)(42));
		FA_5_41_1 : FA port map (stage5(3)(41), stage5(4)(41), stage5(5)(41), stage4(5)(41), stage4(1)(42));
		FA_5_41_2 : FA port map (stage5(6)(41), stage5(7)(41), stage5(8)(41), stage4(6)(41), stage4(2)(42));
		FA_5_41_3 : FA port map (stage5(9)(41), stage5(10)(41), stage5(11)(41), stage4(7)(41), stage4(3)(42));
		stage4(8)(41) <= stage5(12)(41);
	--n_col 42:
		FA_5_42_0 : FA port map (stage5(0)(42), stage5(1)(42), stage5(2)(42), stage4(4)(42), stage4(0)(43));
		FA_5_42_1 : FA port map (stage5(3)(42), stage5(4)(42), stage5(5)(42), stage4(5)(42), stage4(1)(43));
		FA_5_42_2 : FA port map (stage5(6)(42), stage5(7)(42), stage5(8)(42), stage4(6)(42), stage4(2)(43));
		FA_5_42_3 : FA port map (stage5(9)(42), stage5(10)(42), stage5(11)(42), stage4(7)(42), stage4(3)(43));
		stage4(8)(42) <= stage5(12)(42);
	--n_col 43:
		FA_5_43_0 : FA port map (stage5(0)(43), stage5(1)(43), stage5(2)(43), stage4(4)(43), stage4(0)(44));
		FA_5_43_1 : FA port map (stage5(3)(43), stage5(4)(43), stage5(5)(43), stage4(5)(43), stage4(1)(44));
		FA_5_43_2 : FA port map (stage5(6)(43), stage5(7)(43), stage5(8)(43), stage4(6)(43), stage4(2)(44));
		HA_5_43 : HA port map (stage5(9)(43), stage5(10)(43), stage4(7)(43), stage4(3)(44));
		stage4(8)(43) <= stage5(11)(43);
	--n_col 44:
		FA_5_44_0 : FA port map (stage5(0)(44), stage5(1)(44), stage5(2)(44), stage4(4)(44), stage4(0)(45));
		FA_5_44_1 : FA port map (stage5(3)(44), stage5(4)(44), stage5(5)(44), stage4(5)(44), stage4(1)(45));
		FA_5_44_2 : FA port map (stage5(6)(44), stage5(7)(44), stage5(8)(44), stage4(6)(44), stage4(2)(45));
		HA_5_44 : HA port map (stage5(9)(44), stage5(10)(44), stage4(7)(44), stage4(3)(45));
		stage4(8)(44) <= stage5(11)(44);
	--n_col 45:
		FA_5_45_0 : FA port map (stage5(0)(45), stage5(1)(45), stage5(2)(45), stage4(4)(45), stage4(0)(46));
		FA_5_45_1 : FA port map (stage5(3)(45), stage5(4)(45), stage5(5)(45), stage4(5)(45), stage4(1)(46));
		FA_5_45_2 : FA port map (stage5(6)(45), stage5(7)(45), stage5(8)(45), stage4(6)(45), stage4(2)(46));
		stage4(7)(45) <= stage5(9)(45);
		stage4(8)(45) <= stage5(10)(45);
	--n_col 46:
		FA_5_46_0 : FA port map (stage5(0)(46), stage5(1)(46), stage5(2)(46), stage4(3)(46), stage4(0)(47));
		FA_5_46_1 : FA port map (stage5(3)(46), stage5(4)(46), stage5(5)(46), stage4(4)(46), stage4(1)(47));
		HA_5_46 : HA port map (stage5(6)(46), stage5(7)(46), stage4(5)(46), stage4(2)(47));
		stage4(6)(46) <= stage5(8)(46);
		stage4(7)(46) <= stage5(9)(46);
		stage4(8)(46) <= stage5(10)(46);
	--n_col 47:
		FA_5_47_0 : FA port map (stage5(0)(47), stage5(1)(47), stage5(2)(47), stage4(3)(47), stage4(0)(48));
		FA_5_47_1 : FA port map (stage5(3)(47), stage5(4)(47), stage5(5)(47), stage4(4)(47), stage4(1)(48));
		stage4(5)(47) <= stage5(6)(47);
		stage4(6)(47) <= stage5(7)(47);
		stage4(7)(47) <= stage5(8)(47);
		stage4(8)(47) <= stage5(9)(47);
	--n_col 48:
		FA_5_48_0 : FA port map (stage5(0)(48), stage5(1)(48), stage5(2)(48), stage4(2)(48), stage4(0)(49));
		HA_5_48 : HA port map (stage5(3)(48), stage5(4)(48), stage4(3)(48), stage4(1)(49));
		stage4(4)(48) <= stage5(5)(48);
		stage4(5)(48) <= stage5(6)(48);
		stage4(6)(48) <= stage5(7)(48);
		stage4(7)(48) <= stage5(8)(48);
		stage4(8)(48) <= stage5(9)(48);
	--n_col 49:
		FA_5_49_0 : FA port map (stage5(0)(49), stage5(1)(49), stage5(2)(49), stage4(2)(49), stage4(0)(50));
		stage4(3)(49) <= stage5(3)(49);
		stage4(4)(49) <= stage5(4)(49);
		stage4(5)(49) <= stage5(5)(49);
		stage4(6)(49) <= stage5(6)(49);
		stage4(7)(49) <= stage5(7)(49);
		stage4(8)(49) <= stage5(8)(49);
	--n_col 50:
		HA_5_50 : HA port map (stage5(0)(50), stage5(1)(50), stage4(1)(50), stage4(0)(51));
		stage4(2)(50) <= stage5(2)(50);
		stage4(3)(50) <= stage5(3)(50);
		stage4(4)(50) <= stage5(4)(50);
		stage4(5)(50) <= stage5(5)(50);
		stage4(6)(50) <= stage5(6)(50);
		stage4(7)(50) <= stage5(7)(50);
		stage4(8)(50) <= stage5(8)(50);
	--n_col 51:
		stage4(1)(51) <= stage5(0)(51);
		stage4(2)(51) <= stage5(1)(51);
		stage4(3)(51) <= stage5(2)(51);
		stage4(4)(51) <= stage5(3)(51);
		stage4(5)(51) <= stage5(4)(51);
		stage4(6)(51) <= stage5(5)(51);
		stage4(7)(51) <= stage5(6)(51);
		stage4(8)(51) <= stage5(7)(51);
	--n_col 52:
		stage4(0)(52) <= stage5(0)(52);
		stage4(1)(52) <= stage5(1)(52);
		stage4(2)(52) <= stage5(2)(52);
		stage4(3)(52) <= stage5(3)(52);
		stage4(4)(52) <= stage5(4)(52);
		stage4(5)(52) <= stage5(5)(52);
		stage4(6)(52) <= stage5(6)(52);
		stage4(7)(52) <= stage5(7)(52);
	--n_col 53:
		stage4(0)(53) <= stage5(0)(53);
		stage4(1)(53) <= stage5(1)(53);
		stage4(2)(53) <= stage5(2)(53);
		stage4(3)(53) <= stage5(3)(53);
		stage4(4)(53) <= stage5(4)(53);
		stage4(5)(53) <= stage5(5)(53);
		stage4(6)(53) <= stage5(6)(53);
	--n_col 54:
		stage4(0)(54) <= stage5(0)(54);
		stage4(1)(54) <= stage5(1)(54);
		stage4(2)(54) <= stage5(2)(54);
		stage4(3)(54) <= stage5(3)(54);
		stage4(4)(54) <= stage5(4)(54);
		stage4(5)(54) <= stage5(5)(54);
		stage4(6)(54) <= stage5(6)(54);
	--n_col 55:
		stage4(0)(55) <= stage5(0)(55);
		stage4(1)(55) <= stage5(1)(55);
		stage4(2)(55) <= stage5(2)(55);
		stage4(3)(55) <= stage5(3)(55);
		stage4(4)(55) <= stage5(4)(55);
		stage4(5)(55) <= stage5(5)(55);
	--n_col 56:
		stage4(0)(56) <= stage5(0)(56);
		stage4(1)(56) <= stage5(1)(56);
		stage4(2)(56) <= stage5(2)(56);
		stage4(3)(56) <= stage5(3)(56);
		stage4(4)(56) <= stage5(4)(56);
		stage4(5)(56) <= stage5(5)(56);
	--n_col 57:
		stage4(0)(57) <= stage5(0)(57);
		stage4(1)(57) <= stage5(1)(57);
		stage4(2)(57) <= stage5(2)(57);
		stage4(3)(57) <= stage5(3)(57);
		stage4(4)(57) <= stage5(4)(57);
	--n_col 58:
		stage4(0)(58) <= stage5(0)(58);
		stage4(1)(58) <= stage5(1)(58);
		stage4(2)(58) <= stage5(2)(58);
		stage4(3)(58) <= stage5(3)(58);
		stage4(4)(58) <= stage5(4)(58);
	--n_col 59:
		stage4(0)(59) <= stage5(0)(59);
		stage4(1)(59) <= stage5(1)(59);
		stage4(2)(59) <= stage5(2)(59);
		stage4(3)(59) <= stage5(3)(59);
	--n_col 60:
		stage4(0)(60) <= stage5(0)(60);
		stage4(1)(60) <= stage5(1)(60);
		stage4(2)(60) <= stage5(2)(60);
		stage4(3)(60) <= stage5(3)(60);
	--n_col 61:
		stage4(0)(61) <= stage5(0)(61);
		stage4(1)(61) <= stage5(1)(61);
		stage4(2)(61) <= stage5(2)(61);
	--n_col 62:
		stage4(0)(62) <= stage5(0)(62);
		stage4(1)(62) <= stage5(1)(62);
		stage4(2)(62) <= stage5(2)(62);
	--n_col 63:
		stage4(0)(63) <= stage5(0)(63);
		stage4(1)(63) <= stage5(1)(63);

	--stage 4:

	--n_col 0:
		stage3(0)(0) <= stage4(0)(0);
		stage3(1)(0) <= stage4(1)(0);
	--n_col 1:
		stage3(0)(1) <= stage4(0)(1);
	--n_col 2:
		stage3(0)(2) <= stage4(0)(2);
		stage3(1)(2) <= stage4(1)(2);
		stage3(2)(2) <= stage4(2)(2);
	--n_col 3:
		stage3(0)(3) <= stage4(0)(3);
		stage3(1)(3) <= stage4(1)(3);
	--n_col 4:
		stage3(0)(4) <= stage4(0)(4);
		stage3(1)(4) <= stage4(1)(4);
		stage3(2)(4) <= stage4(2)(4);
		stage3(3)(4) <= stage4(3)(4);
	--n_col 5:
		stage3(0)(5) <= stage4(0)(5);
		stage3(1)(5) <= stage4(1)(5);
		stage3(2)(5) <= stage4(2)(5);
	--n_col 6:
		stage3(0)(6) <= stage4(0)(6);
		stage3(1)(6) <= stage4(1)(6);
		stage3(2)(6) <= stage4(2)(6);
		stage3(3)(6) <= stage4(3)(6);
		stage3(4)(6) <= stage4(4)(6);
	--n_col 7:
		stage3(0)(7) <= stage4(0)(7);
		stage3(1)(7) <= stage4(1)(7);
		stage3(2)(7) <= stage4(2)(7);
		stage3(3)(7) <= stage4(3)(7);
	--n_col 8:
		stage3(0)(8) <= stage4(0)(8);
		stage3(1)(8) <= stage4(1)(8);
		stage3(2)(8) <= stage4(2)(8);
		stage3(3)(8) <= stage4(3)(8);
		stage3(4)(8) <= stage4(4)(8);
		stage3(5)(8) <= stage4(5)(8);
	--n_col 9:
		stage3(0)(9) <= stage4(0)(9);
		stage3(1)(9) <= stage4(1)(9);
		stage3(2)(9) <= stage4(2)(9);
		stage3(3)(9) <= stage4(3)(9);
		stage3(4)(9) <= stage4(4)(9);
	--n_col 10:
		HA_4_10 : HA port map (stage4(0)(10), stage4(1)(10), stage3(0)(10), stage3(0)(11));
		stage3(1)(10) <= stage4(2)(10);
		stage3(2)(10) <= stage4(3)(10);
		stage3(3)(10) <= stage4(4)(10);
		stage3(4)(10) <= stage4(5)(10);
		stage3(5)(10) <= stage4(6)(10);
	--n_col 11:
		HA_4_11 : HA port map (stage4(0)(11), stage4(1)(11), stage3(1)(11), stage3(0)(12));
		stage3(2)(11) <= stage4(2)(11);
		stage3(3)(11) <= stage4(3)(11);
		stage3(4)(11) <= stage4(4)(11);
		stage3(5)(11) <= stage4(5)(11);
	--n_col 12:
		FA_4_12_0 : FA port map (stage4(0)(12), stage4(1)(12), stage4(2)(12), stage3(1)(12), stage3(0)(13));
		HA_4_12 : HA port map (stage4(3)(12), stage4(4)(12), stage3(2)(12), stage3(1)(13));
		stage3(3)(12) <= stage4(5)(12);
		stage3(4)(12) <= stage4(6)(12);
		stage3(5)(12) <= stage4(7)(12);
	--n_col 13:
		FA_4_13_0 : FA port map (stage4(0)(13), stage4(1)(13), stage4(2)(13), stage3(2)(13), stage3(0)(14));
		HA_4_13 : HA port map (stage4(3)(13), stage4(4)(13), stage3(3)(13), stage3(1)(14));
		stage3(4)(13) <= stage4(5)(13);
		stage3(5)(13) <= stage4(6)(13);
	--n_col 14:
		FA_4_14_0 : FA port map (stage4(0)(14), stage4(1)(14), stage4(2)(14), stage3(2)(14), stage3(0)(15));
		FA_4_14_1 : FA port map (stage4(3)(14), stage4(4)(14), stage4(5)(14), stage3(3)(14), stage3(1)(15));
		HA_4_14 : HA port map (stage4(6)(14), stage4(7)(14), stage3(4)(14), stage3(2)(15));
		stage3(5)(14) <= stage4(8)(14);
	--n_col 15:
		FA_4_15_0 : FA port map (stage4(0)(15), stage4(1)(15), stage4(2)(15), stage3(3)(15), stage3(0)(16));
		FA_4_15_1 : FA port map (stage4(3)(15), stage4(4)(15), stage4(5)(15), stage3(4)(15), stage3(1)(16));
		HA_4_15 : HA port map (stage4(6)(15), stage4(7)(15), stage3(5)(15), stage3(2)(16));
	--n_col 16:
		FA_4_16_0 : FA port map (stage4(0)(16), stage4(1)(16), stage4(2)(16), stage3(3)(16), stage3(0)(17));
		FA_4_16_1 : FA port map (stage4(3)(16), stage4(4)(16), stage4(5)(16), stage3(4)(16), stage3(1)(17));
		FA_4_16_2 : FA port map (stage4(6)(16), stage4(7)(16), stage4(8)(16), stage3(5)(16), stage3(2)(17));
	--n_col 17:
		FA_4_17_0 : FA port map (stage4(0)(17), stage4(1)(17), stage4(2)(17), stage3(3)(17), stage3(0)(18));
		FA_4_17_1 : FA port map (stage4(3)(17), stage4(4)(17), stage4(5)(17), stage3(4)(17), stage3(1)(18));
		FA_4_17_2 : FA port map (stage4(6)(17), stage4(7)(17), stage4(8)(17), stage3(5)(17), stage3(2)(18));
	--n_col 18:
		FA_4_18_0 : FA port map (stage4(0)(18), stage4(1)(18), stage4(2)(18), stage3(3)(18), stage3(0)(19));
		FA_4_18_1 : FA port map (stage4(3)(18), stage4(4)(18), stage4(5)(18), stage3(4)(18), stage3(1)(19));
		FA_4_18_2 : FA port map (stage4(6)(18), stage4(7)(18), stage4(8)(18), stage3(5)(18), stage3(2)(19));
	--n_col 19:
		FA_4_19_0 : FA port map (stage4(0)(19), stage4(1)(19), stage4(2)(19), stage3(3)(19), stage3(0)(20));
		FA_4_19_1 : FA port map (stage4(3)(19), stage4(4)(19), stage4(5)(19), stage3(4)(19), stage3(1)(20));
		FA_4_19_2 : FA port map (stage4(6)(19), stage4(7)(19), stage4(8)(19), stage3(5)(19), stage3(2)(20));
	--n_col 20:
		FA_4_20_0 : FA port map (stage4(0)(20), stage4(1)(20), stage4(2)(20), stage3(3)(20), stage3(0)(21));
		FA_4_20_1 : FA port map (stage4(3)(20), stage4(4)(20), stage4(5)(20), stage3(4)(20), stage3(1)(21));
		FA_4_20_2 : FA port map (stage4(6)(20), stage4(7)(20), stage4(8)(20), stage3(5)(20), stage3(2)(21));
	--n_col 21:
		FA_4_21_0 : FA port map (stage4(0)(21), stage4(1)(21), stage4(2)(21), stage3(3)(21), stage3(0)(22));
		FA_4_21_1 : FA port map (stage4(3)(21), stage4(4)(21), stage4(5)(21), stage3(4)(21), stage3(1)(22));
		FA_4_21_2 : FA port map (stage4(6)(21), stage4(7)(21), stage4(8)(21), stage3(5)(21), stage3(2)(22));
	--n_col 22:
		FA_4_22_0 : FA port map (stage4(0)(22), stage4(1)(22), stage4(2)(22), stage3(3)(22), stage3(0)(23));
		FA_4_22_1 : FA port map (stage4(3)(22), stage4(4)(22), stage4(5)(22), stage3(4)(22), stage3(1)(23));
		FA_4_22_2 : FA port map (stage4(6)(22), stage4(7)(22), stage4(8)(22), stage3(5)(22), stage3(2)(23));
	--n_col 23:
		FA_4_23_0 : FA port map (stage4(0)(23), stage4(1)(23), stage4(2)(23), stage3(3)(23), stage3(0)(24));
		FA_4_23_1 : FA port map (stage4(3)(23), stage4(4)(23), stage4(5)(23), stage3(4)(23), stage3(1)(24));
		FA_4_23_2 : FA port map (stage4(6)(23), stage4(7)(23), stage4(8)(23), stage3(5)(23), stage3(2)(24));
	--n_col 24:
		FA_4_24_0 : FA port map (stage4(0)(24), stage4(1)(24), stage4(2)(24), stage3(3)(24), stage3(0)(25));
		FA_4_24_1 : FA port map (stage4(3)(24), stage4(4)(24), stage4(5)(24), stage3(4)(24), stage3(1)(25));
		FA_4_24_2 : FA port map (stage4(6)(24), stage4(7)(24), stage4(8)(24), stage3(5)(24), stage3(2)(25));
	--n_col 25:
		FA_4_25_0 : FA port map (stage4(0)(25), stage4(1)(25), stage4(2)(25), stage3(3)(25), stage3(0)(26));
		FA_4_25_1 : FA port map (stage4(3)(25), stage4(4)(25), stage4(5)(25), stage3(4)(25), stage3(1)(26));
		FA_4_25_2 : FA port map (stage4(6)(25), stage4(7)(25), stage4(8)(25), stage3(5)(25), stage3(2)(26));
	--n_col 26:
		FA_4_26_0 : FA port map (stage4(0)(26), stage4(1)(26), stage4(2)(26), stage3(3)(26), stage3(0)(27));
		FA_4_26_1 : FA port map (stage4(3)(26), stage4(4)(26), stage4(5)(26), stage3(4)(26), stage3(1)(27));
		FA_4_26_2 : FA port map (stage4(6)(26), stage4(7)(26), stage4(8)(26), stage3(5)(26), stage3(2)(27));
	--n_col 27:
		FA_4_27_0 : FA port map (stage4(0)(27), stage4(1)(27), stage4(2)(27), stage3(3)(27), stage3(0)(28));
		FA_4_27_1 : FA port map (stage4(3)(27), stage4(4)(27), stage4(5)(27), stage3(4)(27), stage3(1)(28));
		FA_4_27_2 : FA port map (stage4(6)(27), stage4(7)(27), stage4(8)(27), stage3(5)(27), stage3(2)(28));
	--n_col 28:
		FA_4_28_0 : FA port map (stage4(0)(28), stage4(1)(28), stage4(2)(28), stage3(3)(28), stage3(0)(29));
		FA_4_28_1 : FA port map (stage4(3)(28), stage4(4)(28), stage4(5)(28), stage3(4)(28), stage3(1)(29));
		FA_4_28_2 : FA port map (stage4(6)(28), stage4(7)(28), stage4(8)(28), stage3(5)(28), stage3(2)(29));
	--n_col 29:
		FA_4_29_0 : FA port map (stage4(0)(29), stage4(1)(29), stage4(2)(29), stage3(3)(29), stage3(0)(30));
		FA_4_29_1 : FA port map (stage4(3)(29), stage4(4)(29), stage4(5)(29), stage3(4)(29), stage3(1)(30));
		FA_4_29_2 : FA port map (stage4(6)(29), stage4(7)(29), stage4(8)(29), stage3(5)(29), stage3(2)(30));
	--n_col 30:
		FA_4_30_0 : FA port map (stage4(0)(30), stage4(1)(30), stage4(2)(30), stage3(3)(30), stage3(0)(31));
		FA_4_30_1 : FA port map (stage4(3)(30), stage4(4)(30), stage4(5)(30), stage3(4)(30), stage3(1)(31));
		FA_4_30_2 : FA port map (stage4(6)(30), stage4(7)(30), stage4(8)(30), stage3(5)(30), stage3(2)(31));
	--n_col 31:
		FA_4_31_0 : FA port map (stage4(0)(31), stage4(1)(31), stage4(2)(31), stage3(3)(31), stage3(0)(32));
		FA_4_31_1 : FA port map (stage4(3)(31), stage4(4)(31), stage4(5)(31), stage3(4)(31), stage3(1)(32));
		FA_4_31_2 : FA port map (stage4(6)(31), stage4(7)(31), stage4(8)(31), stage3(5)(31), stage3(2)(32));
	--n_col 32:
		FA_4_32_0 : FA port map (stage4(0)(32), stage4(1)(32), stage4(2)(32), stage3(3)(32), stage3(0)(33));
		FA_4_32_1 : FA port map (stage4(3)(32), stage4(4)(32), stage4(5)(32), stage3(4)(32), stage3(1)(33));
		FA_4_32_2 : FA port map (stage4(6)(32), stage4(7)(32), stage4(8)(32), stage3(5)(32), stage3(2)(33));
	--n_col 33:
		FA_4_33_0 : FA port map (stage4(0)(33), stage4(1)(33), stage4(2)(33), stage3(3)(33), stage3(0)(34));
		FA_4_33_1 : FA port map (stage4(3)(33), stage4(4)(33), stage4(5)(33), stage3(4)(33), stage3(1)(34));
		FA_4_33_2 : FA port map (stage4(6)(33), stage4(7)(33), stage4(8)(33), stage3(5)(33), stage3(2)(34));
	--n_col 34:
		FA_4_34_0 : FA port map (stage4(0)(34), stage4(1)(34), stage4(2)(34), stage3(3)(34), stage3(0)(35));
		FA_4_34_1 : FA port map (stage4(3)(34), stage4(4)(34), stage4(5)(34), stage3(4)(34), stage3(1)(35));
		FA_4_34_2 : FA port map (stage4(6)(34), stage4(7)(34), stage4(8)(34), stage3(5)(34), stage3(2)(35));
	--n_col 35:
		FA_4_35_0 : FA port map (stage4(0)(35), stage4(1)(35), stage4(2)(35), stage3(3)(35), stage3(0)(36));
		FA_4_35_1 : FA port map (stage4(3)(35), stage4(4)(35), stage4(5)(35), stage3(4)(35), stage3(1)(36));
		FA_4_35_2 : FA port map (stage4(6)(35), stage4(7)(35), stage4(8)(35), stage3(5)(35), stage3(2)(36));
	--n_col 36:
		FA_4_36_0 : FA port map (stage4(0)(36), stage4(1)(36), stage4(2)(36), stage3(3)(36), stage3(0)(37));
		FA_4_36_1 : FA port map (stage4(3)(36), stage4(4)(36), stage4(5)(36), stage3(4)(36), stage3(1)(37));
		FA_4_36_2 : FA port map (stage4(6)(36), stage4(7)(36), stage4(8)(36), stage3(5)(36), stage3(2)(37));
	--n_col 37:
		FA_4_37_0 : FA port map (stage4(0)(37), stage4(1)(37), stage4(2)(37), stage3(3)(37), stage3(0)(38));
		FA_4_37_1 : FA port map (stage4(3)(37), stage4(4)(37), stage4(5)(37), stage3(4)(37), stage3(1)(38));
		FA_4_37_2 : FA port map (stage4(6)(37), stage4(7)(37), stage4(8)(37), stage3(5)(37), stage3(2)(38));
	--n_col 38:
		FA_4_38_0 : FA port map (stage4(0)(38), stage4(1)(38), stage4(2)(38), stage3(3)(38), stage3(0)(39));
		FA_4_38_1 : FA port map (stage4(3)(38), stage4(4)(38), stage4(5)(38), stage3(4)(38), stage3(1)(39));
		FA_4_38_2 : FA port map (stage4(6)(38), stage4(7)(38), stage4(8)(38), stage3(5)(38), stage3(2)(39));
	--n_col 39:
		FA_4_39_0 : FA port map (stage4(0)(39), stage4(1)(39), stage4(2)(39), stage3(3)(39), stage3(0)(40));
		FA_4_39_1 : FA port map (stage4(3)(39), stage4(4)(39), stage4(5)(39), stage3(4)(39), stage3(1)(40));
		FA_4_39_2 : FA port map (stage4(6)(39), stage4(7)(39), stage4(8)(39), stage3(5)(39), stage3(2)(40));
	--n_col 40:
		FA_4_40_0 : FA port map (stage4(0)(40), stage4(1)(40), stage4(2)(40), stage3(3)(40), stage3(0)(41));
		FA_4_40_1 : FA port map (stage4(3)(40), stage4(4)(40), stage4(5)(40), stage3(4)(40), stage3(1)(41));
		FA_4_40_2 : FA port map (stage4(6)(40), stage4(7)(40), stage4(8)(40), stage3(5)(40), stage3(2)(41));
	--n_col 41:
		FA_4_41_0 : FA port map (stage4(0)(41), stage4(1)(41), stage4(2)(41), stage3(3)(41), stage3(0)(42));
		FA_4_41_1 : FA port map (stage4(3)(41), stage4(4)(41), stage4(5)(41), stage3(4)(41), stage3(1)(42));
		FA_4_41_2 : FA port map (stage4(6)(41), stage4(7)(41), stage4(8)(41), stage3(5)(41), stage3(2)(42));
	--n_col 42:
		FA_4_42_0 : FA port map (stage4(0)(42), stage4(1)(42), stage4(2)(42), stage3(3)(42), stage3(0)(43));
		FA_4_42_1 : FA port map (stage4(3)(42), stage4(4)(42), stage4(5)(42), stage3(4)(42), stage3(1)(43));
		FA_4_42_2 : FA port map (stage4(6)(42), stage4(7)(42), stage4(8)(42), stage3(5)(42), stage3(2)(43));
	--n_col 43:
		FA_4_43_0 : FA port map (stage4(0)(43), stage4(1)(43), stage4(2)(43), stage3(3)(43), stage3(0)(44));
		FA_4_43_1 : FA port map (stage4(3)(43), stage4(4)(43), stage4(5)(43), stage3(4)(43), stage3(1)(44));
		FA_4_43_2 : FA port map (stage4(6)(43), stage4(7)(43), stage4(8)(43), stage3(5)(43), stage3(2)(44));
	--n_col 44:
		FA_4_44_0 : FA port map (stage4(0)(44), stage4(1)(44), stage4(2)(44), stage3(3)(44), stage3(0)(45));
		FA_4_44_1 : FA port map (stage4(3)(44), stage4(4)(44), stage4(5)(44), stage3(4)(44), stage3(1)(45));
		FA_4_44_2 : FA port map (stage4(6)(44), stage4(7)(44), stage4(8)(44), stage3(5)(44), stage3(2)(45));
	--n_col 45:
		FA_4_45_0 : FA port map (stage4(0)(45), stage4(1)(45), stage4(2)(45), stage3(3)(45), stage3(0)(46));
		FA_4_45_1 : FA port map (stage4(3)(45), stage4(4)(45), stage4(5)(45), stage3(4)(45), stage3(1)(46));
		FA_4_45_2 : FA port map (stage4(6)(45), stage4(7)(45), stage4(8)(45), stage3(5)(45), stage3(2)(46));
	--n_col 46:
		FA_4_46_0 : FA port map (stage4(0)(46), stage4(1)(46), stage4(2)(46), stage3(3)(46), stage3(0)(47));
		FA_4_46_1 : FA port map (stage4(3)(46), stage4(4)(46), stage4(5)(46), stage3(4)(46), stage3(1)(47));
		FA_4_46_2 : FA port map (stage4(6)(46), stage4(7)(46), stage4(8)(46), stage3(5)(46), stage3(2)(47));
	--n_col 47:
		FA_4_47_0 : FA port map (stage4(0)(47), stage4(1)(47), stage4(2)(47), stage3(3)(47), stage3(0)(48));
		FA_4_47_1 : FA port map (stage4(3)(47), stage4(4)(47), stage4(5)(47), stage3(4)(47), stage3(1)(48));
		FA_4_47_2 : FA port map (stage4(6)(47), stage4(7)(47), stage4(8)(47), stage3(5)(47), stage3(2)(48));
	--n_col 48:
		FA_4_48_0 : FA port map (stage4(0)(48), stage4(1)(48), stage4(2)(48), stage3(3)(48), stage3(0)(49));
		FA_4_48_1 : FA port map (stage4(3)(48), stage4(4)(48), stage4(5)(48), stage3(4)(48), stage3(1)(49));
		FA_4_48_2 : FA port map (stage4(6)(48), stage4(7)(48), stage4(8)(48), stage3(5)(48), stage3(2)(49));
	--n_col 49:
		FA_4_49_0 : FA port map (stage4(0)(49), stage4(1)(49), stage4(2)(49), stage3(3)(49), stage3(0)(50));
		FA_4_49_1 : FA port map (stage4(3)(49), stage4(4)(49), stage4(5)(49), stage3(4)(49), stage3(1)(50));
		FA_4_49_2 : FA port map (stage4(6)(49), stage4(7)(49), stage4(8)(49), stage3(5)(49), stage3(2)(50));
	--n_col 50:
		FA_4_50_0 : FA port map (stage4(0)(50), stage4(1)(50), stage4(2)(50), stage3(3)(50), stage3(0)(51));
		FA_4_50_1 : FA port map (stage4(3)(50), stage4(4)(50), stage4(5)(50), stage3(4)(50), stage3(1)(51));
		FA_4_50_2 : FA port map (stage4(6)(50), stage4(7)(50), stage4(8)(50), stage3(5)(50), stage3(2)(51));
	--n_col 51:
		FA_4_51_0 : FA port map (stage4(0)(51), stage4(1)(51), stage4(2)(51), stage3(3)(51), stage3(0)(52));
		FA_4_51_1 : FA port map (stage4(3)(51), stage4(4)(51), stage4(5)(51), stage3(4)(51), stage3(1)(52));
		HA_4_51 : HA port map (stage4(6)(51), stage4(7)(51), stage3(5)(51), stage3(2)(52));
	--n_col 52:
		FA_4_52_0 : FA port map (stage4(0)(52), stage4(1)(52), stage4(2)(52), stage3(3)(52), stage3(0)(53));
		FA_4_52_1 : FA port map (stage4(3)(52), stage4(4)(52), stage4(5)(52), stage3(4)(52), stage3(1)(53));
		HA_4_52 : HA port map (stage4(6)(52), stage4(7)(52), stage3(5)(52), stage3(2)(53));
	--n_col 53:
		FA_4_53_0 : FA port map (stage4(0)(53), stage4(1)(53), stage4(2)(53), stage3(3)(53), stage3(0)(54));
		FA_4_53_1 : FA port map (stage4(3)(53), stage4(4)(53), stage4(5)(53), stage3(4)(53), stage3(1)(54));
		stage3(5)(53) <= stage4(6)(53);
	--n_col 54:
		FA_4_54_0 : FA port map (stage4(0)(54), stage4(1)(54), stage4(2)(54), stage3(2)(54), stage3(0)(55));
		HA_4_54 : HA port map (stage4(3)(54), stage4(4)(54), stage3(3)(54), stage3(1)(55));
		stage3(4)(54) <= stage4(5)(54);
		stage3(5)(54) <= stage4(6)(54);
	--n_col 55:
		FA_4_55_0 : FA port map (stage4(0)(55), stage4(1)(55), stage4(2)(55), stage3(2)(55), stage3(0)(56));
		stage3(3)(55) <= stage4(3)(55);
		stage3(4)(55) <= stage4(4)(55);
		stage3(5)(55) <= stage4(5)(55);
	--n_col 56:
		HA_4_56 : HA port map (stage4(0)(56), stage4(1)(56), stage3(1)(56), stage3(0)(57));
		stage3(2)(56) <= stage4(2)(56);
		stage3(3)(56) <= stage4(3)(56);
		stage3(4)(56) <= stage4(4)(56);
		stage3(5)(56) <= stage4(5)(56);
	--n_col 57:
		stage3(1)(57) <= stage4(0)(57);
		stage3(2)(57) <= stage4(1)(57);
		stage3(3)(57) <= stage4(2)(57);
		stage3(4)(57) <= stage4(3)(57);
		stage3(5)(57) <= stage4(4)(57);
	--n_col 58:
		stage3(0)(58) <= stage4(0)(58);
		stage3(1)(58) <= stage4(1)(58);
		stage3(2)(58) <= stage4(2)(58);
		stage3(3)(58) <= stage4(3)(58);
		stage3(4)(58) <= stage4(4)(58);
	--n_col 59:
		stage3(0)(59) <= stage4(0)(59);
		stage3(1)(59) <= stage4(1)(59);
		stage3(2)(59) <= stage4(2)(59);
		stage3(3)(59) <= stage4(3)(59);
	--n_col 60:
		stage3(0)(60) <= stage4(0)(60);
		stage3(1)(60) <= stage4(1)(60);
		stage3(2)(60) <= stage4(2)(60);
		stage3(3)(60) <= stage4(3)(60);
	--n_col 61:
		stage3(0)(61) <= stage4(0)(61);
		stage3(1)(61) <= stage4(1)(61);
		stage3(2)(61) <= stage4(2)(61);
	--n_col 62:
		stage3(0)(62) <= stage4(0)(62);
		stage3(1)(62) <= stage4(1)(62);
		stage3(2)(62) <= stage4(2)(62);
	--n_col 63:
		stage3(0)(63) <= stage4(0)(63);
		stage3(1)(63) <= stage4(1)(63);

	--stage 3:

	--n_col 0:
		stage2(0)(0) <= stage3(0)(0);
		stage2(1)(0) <= stage3(1)(0);
	--n_col 1:
		stage2(0)(1) <= stage3(0)(1);
	--n_col 2:
		stage2(0)(2) <= stage3(0)(2);
		stage2(1)(2) <= stage3(1)(2);
		stage2(2)(2) <= stage3(2)(2);
	--n_col 3:
		stage2(0)(3) <= stage3(0)(3);
		stage2(1)(3) <= stage3(1)(3);
	--n_col 4:
		stage2(0)(4) <= stage3(0)(4);
		stage2(1)(4) <= stage3(1)(4);
		stage2(2)(4) <= stage3(2)(4);
		stage2(3)(4) <= stage3(3)(4);
	--n_col 5:
		stage2(0)(5) <= stage3(0)(5);
		stage2(1)(5) <= stage3(1)(5);
		stage2(2)(5) <= stage3(2)(5);
	--n_col 6:
		HA_3_6 : HA port map (stage3(0)(6), stage3(1)(6), stage2(0)(6), stage2(0)(7));
		stage2(1)(6) <= stage3(2)(6);
		stage2(2)(6) <= stage3(3)(6);
		stage2(3)(6) <= stage3(4)(6);
	--n_col 7:
		HA_3_7 : HA port map (stage3(0)(7), stage3(1)(7), stage2(1)(7), stage2(0)(8));
		stage2(2)(7) <= stage3(2)(7);
		stage2(3)(7) <= stage3(3)(7);
	--n_col 8:
		FA_3_8_0 : FA port map (stage3(0)(8), stage3(1)(8), stage3(2)(8), stage2(1)(8), stage2(0)(9));
		HA_3_8 : HA port map (stage3(3)(8), stage3(4)(8), stage2(2)(8), stage2(1)(9));
		stage2(3)(8) <= stage3(5)(8);
	--n_col 9:
		FA_3_9_0 : FA port map (stage3(0)(9), stage3(1)(9), stage3(2)(9), stage2(2)(9), stage2(0)(10));
		HA_3_9 : HA port map (stage3(3)(9), stage3(4)(9), stage2(3)(9), stage2(1)(10));
	--n_col 10:
		FA_3_10_0 : FA port map (stage3(0)(10), stage3(1)(10), stage3(2)(10), stage2(2)(10), stage2(0)(11));
		FA_3_10_1 : FA port map (stage3(3)(10), stage3(4)(10), stage3(5)(10), stage2(3)(10), stage2(1)(11));
	--n_col 11:
		FA_3_11_0 : FA port map (stage3(0)(11), stage3(1)(11), stage3(2)(11), stage2(2)(11), stage2(0)(12));
		FA_3_11_1 : FA port map (stage3(3)(11), stage3(4)(11), stage3(5)(11), stage2(3)(11), stage2(1)(12));
	--n_col 12:
		FA_3_12_0 : FA port map (stage3(0)(12), stage3(1)(12), stage3(2)(12), stage2(2)(12), stage2(0)(13));
		FA_3_12_1 : FA port map (stage3(3)(12), stage3(4)(12), stage3(5)(12), stage2(3)(12), stage2(1)(13));
	--n_col 13:
		FA_3_13_0 : FA port map (stage3(0)(13), stage3(1)(13), stage3(2)(13), stage2(2)(13), stage2(0)(14));
		FA_3_13_1 : FA port map (stage3(3)(13), stage3(4)(13), stage3(5)(13), stage2(3)(13), stage2(1)(14));
	--n_col 14:
		FA_3_14_0 : FA port map (stage3(0)(14), stage3(1)(14), stage3(2)(14), stage2(2)(14), stage2(0)(15));
		FA_3_14_1 : FA port map (stage3(3)(14), stage3(4)(14), stage3(5)(14), stage2(3)(14), stage2(1)(15));
	--n_col 15:
		FA_3_15_0 : FA port map (stage3(0)(15), stage3(1)(15), stage3(2)(15), stage2(2)(15), stage2(0)(16));
		FA_3_15_1 : FA port map (stage3(3)(15), stage3(4)(15), stage3(5)(15), stage2(3)(15), stage2(1)(16));
	--n_col 16:
		FA_3_16_0 : FA port map (stage3(0)(16), stage3(1)(16), stage3(2)(16), stage2(2)(16), stage2(0)(17));
		FA_3_16_1 : FA port map (stage3(3)(16), stage3(4)(16), stage3(5)(16), stage2(3)(16), stage2(1)(17));
	--n_col 17:
		FA_3_17_0 : FA port map (stage3(0)(17), stage3(1)(17), stage3(2)(17), stage2(2)(17), stage2(0)(18));
		FA_3_17_1 : FA port map (stage3(3)(17), stage3(4)(17), stage3(5)(17), stage2(3)(17), stage2(1)(18));
	--n_col 18:
		FA_3_18_0 : FA port map (stage3(0)(18), stage3(1)(18), stage3(2)(18), stage2(2)(18), stage2(0)(19));
		FA_3_18_1 : FA port map (stage3(3)(18), stage3(4)(18), stage3(5)(18), stage2(3)(18), stage2(1)(19));
	--n_col 19:
		FA_3_19_0 : FA port map (stage3(0)(19), stage3(1)(19), stage3(2)(19), stage2(2)(19), stage2(0)(20));
		FA_3_19_1 : FA port map (stage3(3)(19), stage3(4)(19), stage3(5)(19), stage2(3)(19), stage2(1)(20));
	--n_col 20:
		FA_3_20_0 : FA port map (stage3(0)(20), stage3(1)(20), stage3(2)(20), stage2(2)(20), stage2(0)(21));
		FA_3_20_1 : FA port map (stage3(3)(20), stage3(4)(20), stage3(5)(20), stage2(3)(20), stage2(1)(21));
	--n_col 21:
		FA_3_21_0 : FA port map (stage3(0)(21), stage3(1)(21), stage3(2)(21), stage2(2)(21), stage2(0)(22));
		FA_3_21_1 : FA port map (stage3(3)(21), stage3(4)(21), stage3(5)(21), stage2(3)(21), stage2(1)(22));
	--n_col 22:
		FA_3_22_0 : FA port map (stage3(0)(22), stage3(1)(22), stage3(2)(22), stage2(2)(22), stage2(0)(23));
		FA_3_22_1 : FA port map (stage3(3)(22), stage3(4)(22), stage3(5)(22), stage2(3)(22), stage2(1)(23));
	--n_col 23:
		FA_3_23_0 : FA port map (stage3(0)(23), stage3(1)(23), stage3(2)(23), stage2(2)(23), stage2(0)(24));
		FA_3_23_1 : FA port map (stage3(3)(23), stage3(4)(23), stage3(5)(23), stage2(3)(23), stage2(1)(24));
	--n_col 24:
		FA_3_24_0 : FA port map (stage3(0)(24), stage3(1)(24), stage3(2)(24), stage2(2)(24), stage2(0)(25));
		FA_3_24_1 : FA port map (stage3(3)(24), stage3(4)(24), stage3(5)(24), stage2(3)(24), stage2(1)(25));
	--n_col 25:
		FA_3_25_0 : FA port map (stage3(0)(25), stage3(1)(25), stage3(2)(25), stage2(2)(25), stage2(0)(26));
		FA_3_25_1 : FA port map (stage3(3)(25), stage3(4)(25), stage3(5)(25), stage2(3)(25), stage2(1)(26));
	--n_col 26:
		FA_3_26_0 : FA port map (stage3(0)(26), stage3(1)(26), stage3(2)(26), stage2(2)(26), stage2(0)(27));
		FA_3_26_1 : FA port map (stage3(3)(26), stage3(4)(26), stage3(5)(26), stage2(3)(26), stage2(1)(27));
	--n_col 27:
		FA_3_27_0 : FA port map (stage3(0)(27), stage3(1)(27), stage3(2)(27), stage2(2)(27), stage2(0)(28));
		FA_3_27_1 : FA port map (stage3(3)(27), stage3(4)(27), stage3(5)(27), stage2(3)(27), stage2(1)(28));
	--n_col 28:
		FA_3_28_0 : FA port map (stage3(0)(28), stage3(1)(28), stage3(2)(28), stage2(2)(28), stage2(0)(29));
		FA_3_28_1 : FA port map (stage3(3)(28), stage3(4)(28), stage3(5)(28), stage2(3)(28), stage2(1)(29));
	--n_col 29:
		FA_3_29_0 : FA port map (stage3(0)(29), stage3(1)(29), stage3(2)(29), stage2(2)(29), stage2(0)(30));
		FA_3_29_1 : FA port map (stage3(3)(29), stage3(4)(29), stage3(5)(29), stage2(3)(29), stage2(1)(30));
	--n_col 30:
		FA_3_30_0 : FA port map (stage3(0)(30), stage3(1)(30), stage3(2)(30), stage2(2)(30), stage2(0)(31));
		FA_3_30_1 : FA port map (stage3(3)(30), stage3(4)(30), stage3(5)(30), stage2(3)(30), stage2(1)(31));
	--n_col 31:
		FA_3_31_0 : FA port map (stage3(0)(31), stage3(1)(31), stage3(2)(31), stage2(2)(31), stage2(0)(32));
		FA_3_31_1 : FA port map (stage3(3)(31), stage3(4)(31), stage3(5)(31), stage2(3)(31), stage2(1)(32));
	--n_col 32:
		FA_3_32_0 : FA port map (stage3(0)(32), stage3(1)(32), stage3(2)(32), stage2(2)(32), stage2(0)(33));
		FA_3_32_1 : FA port map (stage3(3)(32), stage3(4)(32), stage3(5)(32), stage2(3)(32), stage2(1)(33));
	--n_col 33:
		FA_3_33_0 : FA port map (stage3(0)(33), stage3(1)(33), stage3(2)(33), stage2(2)(33), stage2(0)(34));
		FA_3_33_1 : FA port map (stage3(3)(33), stage3(4)(33), stage3(5)(33), stage2(3)(33), stage2(1)(34));
	--n_col 34:
		FA_3_34_0 : FA port map (stage3(0)(34), stage3(1)(34), stage3(2)(34), stage2(2)(34), stage2(0)(35));
		FA_3_34_1 : FA port map (stage3(3)(34), stage3(4)(34), stage3(5)(34), stage2(3)(34), stage2(1)(35));
	--n_col 35:
		FA_3_35_0 : FA port map (stage3(0)(35), stage3(1)(35), stage3(2)(35), stage2(2)(35), stage2(0)(36));
		FA_3_35_1 : FA port map (stage3(3)(35), stage3(4)(35), stage3(5)(35), stage2(3)(35), stage2(1)(36));
	--n_col 36:
		FA_3_36_0 : FA port map (stage3(0)(36), stage3(1)(36), stage3(2)(36), stage2(2)(36), stage2(0)(37));
		FA_3_36_1 : FA port map (stage3(3)(36), stage3(4)(36), stage3(5)(36), stage2(3)(36), stage2(1)(37));
	--n_col 37:
		FA_3_37_0 : FA port map (stage3(0)(37), stage3(1)(37), stage3(2)(37), stage2(2)(37), stage2(0)(38));
		FA_3_37_1 : FA port map (stage3(3)(37), stage3(4)(37), stage3(5)(37), stage2(3)(37), stage2(1)(38));
	--n_col 38:
		FA_3_38_0 : FA port map (stage3(0)(38), stage3(1)(38), stage3(2)(38), stage2(2)(38), stage2(0)(39));
		FA_3_38_1 : FA port map (stage3(3)(38), stage3(4)(38), stage3(5)(38), stage2(3)(38), stage2(1)(39));
	--n_col 39:
		FA_3_39_0 : FA port map (stage3(0)(39), stage3(1)(39), stage3(2)(39), stage2(2)(39), stage2(0)(40));
		FA_3_39_1 : FA port map (stage3(3)(39), stage3(4)(39), stage3(5)(39), stage2(3)(39), stage2(1)(40));
	--n_col 40:
		FA_3_40_0 : FA port map (stage3(0)(40), stage3(1)(40), stage3(2)(40), stage2(2)(40), stage2(0)(41));
		FA_3_40_1 : FA port map (stage3(3)(40), stage3(4)(40), stage3(5)(40), stage2(3)(40), stage2(1)(41));
	--n_col 41:
		FA_3_41_0 : FA port map (stage3(0)(41), stage3(1)(41), stage3(2)(41), stage2(2)(41), stage2(0)(42));
		FA_3_41_1 : FA port map (stage3(3)(41), stage3(4)(41), stage3(5)(41), stage2(3)(41), stage2(1)(42));
	--n_col 42:
		FA_3_42_0 : FA port map (stage3(0)(42), stage3(1)(42), stage3(2)(42), stage2(2)(42), stage2(0)(43));
		FA_3_42_1 : FA port map (stage3(3)(42), stage3(4)(42), stage3(5)(42), stage2(3)(42), stage2(1)(43));
	--n_col 43:
		FA_3_43_0 : FA port map (stage3(0)(43), stage3(1)(43), stage3(2)(43), stage2(2)(43), stage2(0)(44));
		FA_3_43_1 : FA port map (stage3(3)(43), stage3(4)(43), stage3(5)(43), stage2(3)(43), stage2(1)(44));
	--n_col 44:
		FA_3_44_0 : FA port map (stage3(0)(44), stage3(1)(44), stage3(2)(44), stage2(2)(44), stage2(0)(45));
		FA_3_44_1 : FA port map (stage3(3)(44), stage3(4)(44), stage3(5)(44), stage2(3)(44), stage2(1)(45));
	--n_col 45:
		FA_3_45_0 : FA port map (stage3(0)(45), stage3(1)(45), stage3(2)(45), stage2(2)(45), stage2(0)(46));
		FA_3_45_1 : FA port map (stage3(3)(45), stage3(4)(45), stage3(5)(45), stage2(3)(45), stage2(1)(46));
	--n_col 46:
		FA_3_46_0 : FA port map (stage3(0)(46), stage3(1)(46), stage3(2)(46), stage2(2)(46), stage2(0)(47));
		FA_3_46_1 : FA port map (stage3(3)(46), stage3(4)(46), stage3(5)(46), stage2(3)(46), stage2(1)(47));
	--n_col 47:
		FA_3_47_0 : FA port map (stage3(0)(47), stage3(1)(47), stage3(2)(47), stage2(2)(47), stage2(0)(48));
		FA_3_47_1 : FA port map (stage3(3)(47), stage3(4)(47), stage3(5)(47), stage2(3)(47), stage2(1)(48));
	--n_col 48:
		FA_3_48_0 : FA port map (stage3(0)(48), stage3(1)(48), stage3(2)(48), stage2(2)(48), stage2(0)(49));
		FA_3_48_1 : FA port map (stage3(3)(48), stage3(4)(48), stage3(5)(48), stage2(3)(48), stage2(1)(49));
	--n_col 49:
		FA_3_49_0 : FA port map (stage3(0)(49), stage3(1)(49), stage3(2)(49), stage2(2)(49), stage2(0)(50));
		FA_3_49_1 : FA port map (stage3(3)(49), stage3(4)(49), stage3(5)(49), stage2(3)(49), stage2(1)(50));
	--n_col 50:
		FA_3_50_0 : FA port map (stage3(0)(50), stage3(1)(50), stage3(2)(50), stage2(2)(50), stage2(0)(51));
		FA_3_50_1 : FA port map (stage3(3)(50), stage3(4)(50), stage3(5)(50), stage2(3)(50), stage2(1)(51));
	--n_col 51:
		FA_3_51_0 : FA port map (stage3(0)(51), stage3(1)(51), stage3(2)(51), stage2(2)(51), stage2(0)(52));
		FA_3_51_1 : FA port map (stage3(3)(51), stage3(4)(51), stage3(5)(51), stage2(3)(51), stage2(1)(52));
	--n_col 52:
		FA_3_52_0 : FA port map (stage3(0)(52), stage3(1)(52), stage3(2)(52), stage2(2)(52), stage2(0)(53));
		FA_3_52_1 : FA port map (stage3(3)(52), stage3(4)(52), stage3(5)(52), stage2(3)(52), stage2(1)(53));
	--n_col 53:
		FA_3_53_0 : FA port map (stage3(0)(53), stage3(1)(53), stage3(2)(53), stage2(2)(53), stage2(0)(54));
		FA_3_53_1 : FA port map (stage3(3)(53), stage3(4)(53), stage3(5)(53), stage2(3)(53), stage2(1)(54));
	--n_col 54:
		FA_3_54_0 : FA port map (stage3(0)(54), stage3(1)(54), stage3(2)(54), stage2(2)(54), stage2(0)(55));
		FA_3_54_1 : FA port map (stage3(3)(54), stage3(4)(54), stage3(5)(54), stage2(3)(54), stage2(1)(55));
	--n_col 55:
		FA_3_55_0 : FA port map (stage3(0)(55), stage3(1)(55), stage3(2)(55), stage2(2)(55), stage2(0)(56));
		FA_3_55_1 : FA port map (stage3(3)(55), stage3(4)(55), stage3(5)(55), stage2(3)(55), stage2(1)(56));
	--n_col 56:
		FA_3_56_0 : FA port map (stage3(0)(56), stage3(1)(56), stage3(2)(56), stage2(2)(56), stage2(0)(57));
		FA_3_56_1 : FA port map (stage3(3)(56), stage3(4)(56), stage3(5)(56), stage2(3)(56), stage2(1)(57));
	--n_col 57:
		FA_3_57_0 : FA port map (stage3(0)(57), stage3(1)(57), stage3(2)(57), stage2(2)(57), stage2(0)(58));
		HA_3_57 : HA port map (stage3(3)(57), stage3(4)(57), stage2(3)(57), stage2(1)(58));
	--n_col 58:
		FA_3_58_0 : FA port map (stage3(0)(58), stage3(1)(58), stage3(2)(58), stage2(2)(58), stage2(0)(59));
		HA_3_58 : HA port map (stage3(3)(58), stage3(4)(58), stage2(3)(58), stage2(1)(59));
	--n_col 59:
		FA_3_59_0 : FA port map (stage3(0)(59), stage3(1)(59), stage3(2)(59), stage2(2)(59), stage2(0)(60));
		stage2(3)(59) <= stage3(3)(59);
	--n_col 60:
		HA_3_60 : HA port map (stage3(0)(60), stage3(1)(60), stage2(1)(60), stage2(0)(61));
		stage2(2)(60) <= stage3(2)(60);
		stage2(3)(60) <= stage3(3)(60);
	--n_col 61:
		stage2(1)(61) <= stage3(0)(61);
		stage2(2)(61) <= stage3(1)(61);
		stage2(3)(61) <= stage3(2)(61);
	--n_col 62:
		stage2(0)(62) <= stage3(0)(62);
		stage2(1)(62) <= stage3(1)(62);
		stage2(2)(62) <= stage3(2)(62);
	--n_col 63:
		stage2(0)(63) <= stage3(0)(63);
		stage2(1)(63) <= stage3(1)(63);

	--stage 2:

	--n_col 0:
		stage1(0)(0) <= stage2(0)(0);
		stage1(1)(0) <= stage2(1)(0);
	--n_col 1:
		stage1(0)(1) <= stage2(0)(1);
	--n_col 2:
		stage1(0)(2) <= stage2(0)(2);
		stage1(1)(2) <= stage2(1)(2);
		stage1(2)(2) <= stage2(2)(2);
	--n_col 3:
		stage1(0)(3) <= stage2(0)(3);
		stage1(1)(3) <= stage2(1)(3);
	--n_col 4:
		HA_2_4 : HA port map (stage2(0)(4), stage2(1)(4), stage1(0)(4), stage1(0)(5));
		stage1(1)(4) <= stage2(2)(4);
		stage1(2)(4) <= stage2(3)(4);
	--n_col 5:
		HA_2_5 : HA port map (stage2(0)(5), stage2(1)(5), stage1(1)(5), stage1(0)(6));
		stage1(2)(5) <= stage2(2)(5);
	--n_col 6:
		FA_2_6_0 : FA port map (stage2(0)(6), stage2(1)(6), stage2(2)(6), stage1(1)(6), stage1(0)(7));
		stage1(2)(6) <= stage2(3)(6);
	--n_col 7:
		FA_2_7_0 : FA port map (stage2(0)(7), stage2(1)(7), stage2(2)(7), stage1(1)(7), stage1(0)(8));
		stage1(2)(7) <= stage2(3)(7);
	--n_col 8:
		FA_2_8_0 : FA port map (stage2(0)(8), stage2(1)(8), stage2(2)(8), stage1(1)(8), stage1(0)(9));
		stage1(2)(8) <= stage2(3)(8);
	--n_col 9:
		FA_2_9_0 : FA port map (stage2(0)(9), stage2(1)(9), stage2(2)(9), stage1(1)(9), stage1(0)(10));
		stage1(2)(9) <= stage2(3)(9);
	--n_col 10:
		FA_2_10_0 : FA port map (stage2(0)(10), stage2(1)(10), stage2(2)(10), stage1(1)(10), stage1(0)(11));
		stage1(2)(10) <= stage2(3)(10);
	--n_col 11:
		FA_2_11_0 : FA port map (stage2(0)(11), stage2(1)(11), stage2(2)(11), stage1(1)(11), stage1(0)(12));
		stage1(2)(11) <= stage2(3)(11);
	--n_col 12:
		FA_2_12_0 : FA port map (stage2(0)(12), stage2(1)(12), stage2(2)(12), stage1(1)(12), stage1(0)(13));
		stage1(2)(12) <= stage2(3)(12);
	--n_col 13:
		FA_2_13_0 : FA port map (stage2(0)(13), stage2(1)(13), stage2(2)(13), stage1(1)(13), stage1(0)(14));
		stage1(2)(13) <= stage2(3)(13);
	--n_col 14:
		FA_2_14_0 : FA port map (stage2(0)(14), stage2(1)(14), stage2(2)(14), stage1(1)(14), stage1(0)(15));
		stage1(2)(14) <= stage2(3)(14);
	--n_col 15:
		FA_2_15_0 : FA port map (stage2(0)(15), stage2(1)(15), stage2(2)(15), stage1(1)(15), stage1(0)(16));
		stage1(2)(15) <= stage2(3)(15);
	--n_col 16:
		FA_2_16_0 : FA port map (stage2(0)(16), stage2(1)(16), stage2(2)(16), stage1(1)(16), stage1(0)(17));
		stage1(2)(16) <= stage2(3)(16);
	--n_col 17:
		FA_2_17_0 : FA port map (stage2(0)(17), stage2(1)(17), stage2(2)(17), stage1(1)(17), stage1(0)(18));
		stage1(2)(17) <= stage2(3)(17);
	--n_col 18:
		FA_2_18_0 : FA port map (stage2(0)(18), stage2(1)(18), stage2(2)(18), stage1(1)(18), stage1(0)(19));
		stage1(2)(18) <= stage2(3)(18);
	--n_col 19:
		FA_2_19_0 : FA port map (stage2(0)(19), stage2(1)(19), stage2(2)(19), stage1(1)(19), stage1(0)(20));
		stage1(2)(19) <= stage2(3)(19);
	--n_col 20:
		FA_2_20_0 : FA port map (stage2(0)(20), stage2(1)(20), stage2(2)(20), stage1(1)(20), stage1(0)(21));
		stage1(2)(20) <= stage2(3)(20);
	--n_col 21:
		FA_2_21_0 : FA port map (stage2(0)(21), stage2(1)(21), stage2(2)(21), stage1(1)(21), stage1(0)(22));
		stage1(2)(21) <= stage2(3)(21);
	--n_col 22:
		FA_2_22_0 : FA port map (stage2(0)(22), stage2(1)(22), stage2(2)(22), stage1(1)(22), stage1(0)(23));
		stage1(2)(22) <= stage2(3)(22);
	--n_col 23:
		FA_2_23_0 : FA port map (stage2(0)(23), stage2(1)(23), stage2(2)(23), stage1(1)(23), stage1(0)(24));
		stage1(2)(23) <= stage2(3)(23);
	--n_col 24:
		FA_2_24_0 : FA port map (stage2(0)(24), stage2(1)(24), stage2(2)(24), stage1(1)(24), stage1(0)(25));
		stage1(2)(24) <= stage2(3)(24);
	--n_col 25:
		FA_2_25_0 : FA port map (stage2(0)(25), stage2(1)(25), stage2(2)(25), stage1(1)(25), stage1(0)(26));
		stage1(2)(25) <= stage2(3)(25);
	--n_col 26:
		FA_2_26_0 : FA port map (stage2(0)(26), stage2(1)(26), stage2(2)(26), stage1(1)(26), stage1(0)(27));
		stage1(2)(26) <= stage2(3)(26);
	--n_col 27:
		FA_2_27_0 : FA port map (stage2(0)(27), stage2(1)(27), stage2(2)(27), stage1(1)(27), stage1(0)(28));
		stage1(2)(27) <= stage2(3)(27);
	--n_col 28:
		FA_2_28_0 : FA port map (stage2(0)(28), stage2(1)(28), stage2(2)(28), stage1(1)(28), stage1(0)(29));
		stage1(2)(28) <= stage2(3)(28);
	--n_col 29:
		FA_2_29_0 : FA port map (stage2(0)(29), stage2(1)(29), stage2(2)(29), stage1(1)(29), stage1(0)(30));
		stage1(2)(29) <= stage2(3)(29);
	--n_col 30:
		FA_2_30_0 : FA port map (stage2(0)(30), stage2(1)(30), stage2(2)(30), stage1(1)(30), stage1(0)(31));
		stage1(2)(30) <= stage2(3)(30);
	--n_col 31:
		FA_2_31_0 : FA port map (stage2(0)(31), stage2(1)(31), stage2(2)(31), stage1(1)(31), stage1(0)(32));
		stage1(2)(31) <= stage2(3)(31);
	--n_col 32:
		FA_2_32_0 : FA port map (stage2(0)(32), stage2(1)(32), stage2(2)(32), stage1(1)(32), stage1(0)(33));
		stage1(2)(32) <= stage2(3)(32);
	--n_col 33:
		FA_2_33_0 : FA port map (stage2(0)(33), stage2(1)(33), stage2(2)(33), stage1(1)(33), stage1(0)(34));
		stage1(2)(33) <= stage2(3)(33);
	--n_col 34:
		FA_2_34_0 : FA port map (stage2(0)(34), stage2(1)(34), stage2(2)(34), stage1(1)(34), stage1(0)(35));
		stage1(2)(34) <= stage2(3)(34);
	--n_col 35:
		FA_2_35_0 : FA port map (stage2(0)(35), stage2(1)(35), stage2(2)(35), stage1(1)(35), stage1(0)(36));
		stage1(2)(35) <= stage2(3)(35);
	--n_col 36:
		FA_2_36_0 : FA port map (stage2(0)(36), stage2(1)(36), stage2(2)(36), stage1(1)(36), stage1(0)(37));
		stage1(2)(36) <= stage2(3)(36);
	--n_col 37:
		FA_2_37_0 : FA port map (stage2(0)(37), stage2(1)(37), stage2(2)(37), stage1(1)(37), stage1(0)(38));
		stage1(2)(37) <= stage2(3)(37);
	--n_col 38:
		FA_2_38_0 : FA port map (stage2(0)(38), stage2(1)(38), stage2(2)(38), stage1(1)(38), stage1(0)(39));
		stage1(2)(38) <= stage2(3)(38);
	--n_col 39:
		FA_2_39_0 : FA port map (stage2(0)(39), stage2(1)(39), stage2(2)(39), stage1(1)(39), stage1(0)(40));
		stage1(2)(39) <= stage2(3)(39);
	--n_col 40:
		FA_2_40_0 : FA port map (stage2(0)(40), stage2(1)(40), stage2(2)(40), stage1(1)(40), stage1(0)(41));
		stage1(2)(40) <= stage2(3)(40);
	--n_col 41:
		FA_2_41_0 : FA port map (stage2(0)(41), stage2(1)(41), stage2(2)(41), stage1(1)(41), stage1(0)(42));
		stage1(2)(41) <= stage2(3)(41);
	--n_col 42:
		FA_2_42_0 : FA port map (stage2(0)(42), stage2(1)(42), stage2(2)(42), stage1(1)(42), stage1(0)(43));
		stage1(2)(42) <= stage2(3)(42);
	--n_col 43:
		FA_2_43_0 : FA port map (stage2(0)(43), stage2(1)(43), stage2(2)(43), stage1(1)(43), stage1(0)(44));
		stage1(2)(43) <= stage2(3)(43);
	--n_col 44:
		FA_2_44_0 : FA port map (stage2(0)(44), stage2(1)(44), stage2(2)(44), stage1(1)(44), stage1(0)(45));
		stage1(2)(44) <= stage2(3)(44);
	--n_col 45:
		FA_2_45_0 : FA port map (stage2(0)(45), stage2(1)(45), stage2(2)(45), stage1(1)(45), stage1(0)(46));
		stage1(2)(45) <= stage2(3)(45);
	--n_col 46:
		FA_2_46_0 : FA port map (stage2(0)(46), stage2(1)(46), stage2(2)(46), stage1(1)(46), stage1(0)(47));
		stage1(2)(46) <= stage2(3)(46);
	--n_col 47:
		FA_2_47_0 : FA port map (stage2(0)(47), stage2(1)(47), stage2(2)(47), stage1(1)(47), stage1(0)(48));
		stage1(2)(47) <= stage2(3)(47);
	--n_col 48:
		FA_2_48_0 : FA port map (stage2(0)(48), stage2(1)(48), stage2(2)(48), stage1(1)(48), stage1(0)(49));
		stage1(2)(48) <= stage2(3)(48);
	--n_col 49:
		FA_2_49_0 : FA port map (stage2(0)(49), stage2(1)(49), stage2(2)(49), stage1(1)(49), stage1(0)(50));
		stage1(2)(49) <= stage2(3)(49);
	--n_col 50:
		FA_2_50_0 : FA port map (stage2(0)(50), stage2(1)(50), stage2(2)(50), stage1(1)(50), stage1(0)(51));
		stage1(2)(50) <= stage2(3)(50);
	--n_col 51:
		FA_2_51_0 : FA port map (stage2(0)(51), stage2(1)(51), stage2(2)(51), stage1(1)(51), stage1(0)(52));
		stage1(2)(51) <= stage2(3)(51);
	--n_col 52:
		FA_2_52_0 : FA port map (stage2(0)(52), stage2(1)(52), stage2(2)(52), stage1(1)(52), stage1(0)(53));
		stage1(2)(52) <= stage2(3)(52);
	--n_col 53:
		FA_2_53_0 : FA port map (stage2(0)(53), stage2(1)(53), stage2(2)(53), stage1(1)(53), stage1(0)(54));
		stage1(2)(53) <= stage2(3)(53);
	--n_col 54:
		FA_2_54_0 : FA port map (stage2(0)(54), stage2(1)(54), stage2(2)(54), stage1(1)(54), stage1(0)(55));
		stage1(2)(54) <= stage2(3)(54);
	--n_col 55:
		FA_2_55_0 : FA port map (stage2(0)(55), stage2(1)(55), stage2(2)(55), stage1(1)(55), stage1(0)(56));
		stage1(2)(55) <= stage2(3)(55);
	--n_col 56:
		FA_2_56_0 : FA port map (stage2(0)(56), stage2(1)(56), stage2(2)(56), stage1(1)(56), stage1(0)(57));
		stage1(2)(56) <= stage2(3)(56);
	--n_col 57:
		FA_2_57_0 : FA port map (stage2(0)(57), stage2(1)(57), stage2(2)(57), stage1(1)(57), stage1(0)(58));
		stage1(2)(57) <= stage2(3)(57);
	--n_col 58:
		FA_2_58_0 : FA port map (stage2(0)(58), stage2(1)(58), stage2(2)(58), stage1(1)(58), stage1(0)(59));
		stage1(2)(58) <= stage2(3)(58);
	--n_col 59:
		FA_2_59_0 : FA port map (stage2(0)(59), stage2(1)(59), stage2(2)(59), stage1(1)(59), stage1(0)(60));
		stage1(2)(59) <= stage2(3)(59);
	--n_col 60:
		FA_2_60_0 : FA port map (stage2(0)(60), stage2(1)(60), stage2(2)(60), stage1(1)(60), stage1(0)(61));
		stage1(2)(60) <= stage2(3)(60);
	--n_col 61:
		HA_2_61 : HA port map (stage2(0)(61), stage2(1)(61), stage1(1)(61), stage1(0)(62));
		stage1(2)(61) <= stage2(2)(61);
	--n_col 62:
		HA_2_62 : HA port map (stage2(0)(62), stage2(1)(62), stage1(1)(62), stage1(0)(63));
		stage1(2)(62) <= stage2(2)(62);
	--n_col 63:
		stage1(1)(63) <= stage2(0)(63);
		stage1(2)(63) <= stage2(1)(63);

	--stage 1:

	--n_col 0:
		stage0(0)(0) <= stage1(0)(0);
		stage0(1)(0) <= stage1(1)(0);
	--n_col 1:
		stage0(0)(1) <= stage1(0)(1);
	--n_col 2:
		HA_1_2 : HA port map (stage1(0)(2), stage1(1)(2), stage0(0)(2), stage0(0)(3));
		stage0(1)(2) <= stage1(2)(2);
	--n_col 3:
		HA_1_3 : HA port map (stage1(0)(3), stage1(1)(3), stage0(1)(3), stage0(0)(4));
	--n_col 4:
		FA_1_4_0 : FA port map (stage1(0)(4), stage1(1)(4), stage1(2)(4), stage0(1)(4), stage0(0)(5));
	--n_col 5:
		FA_1_5_0 : FA port map (stage1(0)(5), stage1(1)(5), stage1(2)(5), stage0(1)(5), stage0(0)(6));
	--n_col 6:
		FA_1_6_0 : FA port map (stage1(0)(6), stage1(1)(6), stage1(2)(6), stage0(1)(6), stage0(0)(7));
	--n_col 7:
		FA_1_7_0 : FA port map (stage1(0)(7), stage1(1)(7), stage1(2)(7), stage0(1)(7), stage0(0)(8));
	--n_col 8:
		FA_1_8_0 : FA port map (stage1(0)(8), stage1(1)(8), stage1(2)(8), stage0(1)(8), stage0(0)(9));
	--n_col 9:
		FA_1_9_0 : FA port map (stage1(0)(9), stage1(1)(9), stage1(2)(9), stage0(1)(9), stage0(0)(10));
	--n_col 10:
		FA_1_10_0 : FA port map (stage1(0)(10), stage1(1)(10), stage1(2)(10), stage0(1)(10), stage0(0)(11));
	--n_col 11:
		FA_1_11_0 : FA port map (stage1(0)(11), stage1(1)(11), stage1(2)(11), stage0(1)(11), stage0(0)(12));
	--n_col 12:
		FA_1_12_0 : FA port map (stage1(0)(12), stage1(1)(12), stage1(2)(12), stage0(1)(12), stage0(0)(13));
	--n_col 13:
		FA_1_13_0 : FA port map (stage1(0)(13), stage1(1)(13), stage1(2)(13), stage0(1)(13), stage0(0)(14));
	--n_col 14:
		FA_1_14_0 : FA port map (stage1(0)(14), stage1(1)(14), stage1(2)(14), stage0(1)(14), stage0(0)(15));
	--n_col 15:
		FA_1_15_0 : FA port map (stage1(0)(15), stage1(1)(15), stage1(2)(15), stage0(1)(15), stage0(0)(16));
	--n_col 16:
		FA_1_16_0 : FA port map (stage1(0)(16), stage1(1)(16), stage1(2)(16), stage0(1)(16), stage0(0)(17));
	--n_col 17:
		FA_1_17_0 : FA port map (stage1(0)(17), stage1(1)(17), stage1(2)(17), stage0(1)(17), stage0(0)(18));
	--n_col 18:
		FA_1_18_0 : FA port map (stage1(0)(18), stage1(1)(18), stage1(2)(18), stage0(1)(18), stage0(0)(19));
	--n_col 19:
		FA_1_19_0 : FA port map (stage1(0)(19), stage1(1)(19), stage1(2)(19), stage0(1)(19), stage0(0)(20));
	--n_col 20:
		FA_1_20_0 : FA port map (stage1(0)(20), stage1(1)(20), stage1(2)(20), stage0(1)(20), stage0(0)(21));
	--n_col 21:
		FA_1_21_0 : FA port map (stage1(0)(21), stage1(1)(21), stage1(2)(21), stage0(1)(21), stage0(0)(22));
	--n_col 22:
		FA_1_22_0 : FA port map (stage1(0)(22), stage1(1)(22), stage1(2)(22), stage0(1)(22), stage0(0)(23));
	--n_col 23:
		FA_1_23_0 : FA port map (stage1(0)(23), stage1(1)(23), stage1(2)(23), stage0(1)(23), stage0(0)(24));
	--n_col 24:
		FA_1_24_0 : FA port map (stage1(0)(24), stage1(1)(24), stage1(2)(24), stage0(1)(24), stage0(0)(25));
	--n_col 25:
		FA_1_25_0 : FA port map (stage1(0)(25), stage1(1)(25), stage1(2)(25), stage0(1)(25), stage0(0)(26));
	--n_col 26:
		FA_1_26_0 : FA port map (stage1(0)(26), stage1(1)(26), stage1(2)(26), stage0(1)(26), stage0(0)(27));
	--n_col 27:
		FA_1_27_0 : FA port map (stage1(0)(27), stage1(1)(27), stage1(2)(27), stage0(1)(27), stage0(0)(28));
	--n_col 28:
		FA_1_28_0 : FA port map (stage1(0)(28), stage1(1)(28), stage1(2)(28), stage0(1)(28), stage0(0)(29));
	--n_col 29:
		FA_1_29_0 : FA port map (stage1(0)(29), stage1(1)(29), stage1(2)(29), stage0(1)(29), stage0(0)(30));
	--n_col 30:
		FA_1_30_0 : FA port map (stage1(0)(30), stage1(1)(30), stage1(2)(30), stage0(1)(30), stage0(0)(31));
	--n_col 31:
		FA_1_31_0 : FA port map (stage1(0)(31), stage1(1)(31), stage1(2)(31), stage0(1)(31), stage0(0)(32));
	--n_col 32:
		FA_1_32_0 : FA port map (stage1(0)(32), stage1(1)(32), stage1(2)(32), stage0(1)(32), stage0(0)(33));
	--n_col 33:
		FA_1_33_0 : FA port map (stage1(0)(33), stage1(1)(33), stage1(2)(33), stage0(1)(33), stage0(0)(34));
	--n_col 34:
		FA_1_34_0 : FA port map (stage1(0)(34), stage1(1)(34), stage1(2)(34), stage0(1)(34), stage0(0)(35));
	--n_col 35:
		FA_1_35_0 : FA port map (stage1(0)(35), stage1(1)(35), stage1(2)(35), stage0(1)(35), stage0(0)(36));
	--n_col 36:
		FA_1_36_0 : FA port map (stage1(0)(36), stage1(1)(36), stage1(2)(36), stage0(1)(36), stage0(0)(37));
	--n_col 37:
		FA_1_37_0 : FA port map (stage1(0)(37), stage1(1)(37), stage1(2)(37), stage0(1)(37), stage0(0)(38));
	--n_col 38:
		FA_1_38_0 : FA port map (stage1(0)(38), stage1(1)(38), stage1(2)(38), stage0(1)(38), stage0(0)(39));
	--n_col 39:
		FA_1_39_0 : FA port map (stage1(0)(39), stage1(1)(39), stage1(2)(39), stage0(1)(39), stage0(0)(40));
	--n_col 40:
		FA_1_40_0 : FA port map (stage1(0)(40), stage1(1)(40), stage1(2)(40), stage0(1)(40), stage0(0)(41));
	--n_col 41:
		FA_1_41_0 : FA port map (stage1(0)(41), stage1(1)(41), stage1(2)(41), stage0(1)(41), stage0(0)(42));
	--n_col 42:
		FA_1_42_0 : FA port map (stage1(0)(42), stage1(1)(42), stage1(2)(42), stage0(1)(42), stage0(0)(43));
	--n_col 43:
		FA_1_43_0 : FA port map (stage1(0)(43), stage1(1)(43), stage1(2)(43), stage0(1)(43), stage0(0)(44));
	--n_col 44:
		FA_1_44_0 : FA port map (stage1(0)(44), stage1(1)(44), stage1(2)(44), stage0(1)(44), stage0(0)(45));
	--n_col 45:
		FA_1_45_0 : FA port map (stage1(0)(45), stage1(1)(45), stage1(2)(45), stage0(1)(45), stage0(0)(46));
	--n_col 46:
		FA_1_46_0 : FA port map (stage1(0)(46), stage1(1)(46), stage1(2)(46), stage0(1)(46), stage0(0)(47));
	--n_col 47:
		FA_1_47_0 : FA port map (stage1(0)(47), stage1(1)(47), stage1(2)(47), stage0(1)(47), stage0(0)(48));
	--n_col 48:
		FA_1_48_0 : FA port map (stage1(0)(48), stage1(1)(48), stage1(2)(48), stage0(1)(48), stage0(0)(49));
	--n_col 49:
		FA_1_49_0 : FA port map (stage1(0)(49), stage1(1)(49), stage1(2)(49), stage0(1)(49), stage0(0)(50));
	--n_col 50:
		FA_1_50_0 : FA port map (stage1(0)(50), stage1(1)(50), stage1(2)(50), stage0(1)(50), stage0(0)(51));
	--n_col 51:
		FA_1_51_0 : FA port map (stage1(0)(51), stage1(1)(51), stage1(2)(51), stage0(1)(51), stage0(0)(52));
	--n_col 52:
		FA_1_52_0 : FA port map (stage1(0)(52), stage1(1)(52), stage1(2)(52), stage0(1)(52), stage0(0)(53));
	--n_col 53:
		FA_1_53_0 : FA port map (stage1(0)(53), stage1(1)(53), stage1(2)(53), stage0(1)(53), stage0(0)(54));
	--n_col 54:
		FA_1_54_0 : FA port map (stage1(0)(54), stage1(1)(54), stage1(2)(54), stage0(1)(54), stage0(0)(55));
	--n_col 55:
		FA_1_55_0 : FA port map (stage1(0)(55), stage1(1)(55), stage1(2)(55), stage0(1)(55), stage0(0)(56));
	--n_col 56:
		FA_1_56_0 : FA port map (stage1(0)(56), stage1(1)(56), stage1(2)(56), stage0(1)(56), stage0(0)(57));
	--n_col 57:
		FA_1_57_0 : FA port map (stage1(0)(57), stage1(1)(57), stage1(2)(57), stage0(1)(57), stage0(0)(58));
	--n_col 58:
		FA_1_58_0 : FA port map (stage1(0)(58), stage1(1)(58), stage1(2)(58), stage0(1)(58), stage0(0)(59));
	--n_col 59:
		FA_1_59_0 : FA port map (stage1(0)(59), stage1(1)(59), stage1(2)(59), stage0(1)(59), stage0(0)(60));
	--n_col 60:
		FA_1_60_0 : FA port map (stage1(0)(60), stage1(1)(60), stage1(2)(60), stage0(1)(60), stage0(0)(61));
	--n_col 61:
		FA_1_61_0 : FA port map (stage1(0)(61), stage1(1)(61), stage1(2)(61), stage0(1)(61), stage0(0)(62));
	--n_col 62:
		FA_1_62_0 : FA port map (stage1(0)(62), stage1(1)(62), stage1(2)(62), stage0(1)(62), stage0(0)(63));
	--n_col 63:
		HA_1_63 : HA port map (stage1(0)(63), stage1(1)(63), stage0(1)(63), stage0(0)(64));

	--output assignment:
		O1 <= stage0(0)(2*nbit-1 downto 0);
		O2 <= stage0(1)(2*nbit-1 downto 2) & '0' & stage0(1)(0); --assigned to zero, not used in the algorithm

end architecture;