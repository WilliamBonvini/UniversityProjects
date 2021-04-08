-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Thu May 31 10:21:45 2018
-- Host        : Zebes-Legion running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/polimi/ImageScanner/ImageScanner.sim/sim_1/synth/func/xsim/quadrato_func_synth.vhd
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comp_bot is
  port (
    o_end_reg_0 : out STD_LOGIC;
    \o_address_reg[3]_0\ : out STD_LOGIC;
    state174_out : out STD_LOGIC;
    \o_address_reg[3]_1\ : out STD_LOGIC;
    \state_reg[0]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_we_reg : out STD_LOGIC;
    o_en_reg : out STD_LOGIC;
    o_done_reg : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \real_height_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \real_height_reg[7]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \real_height_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \o_address_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \tmp_area_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \total_area_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    i_rst_IBUF : in STD_LOGIC;
    i_clk_IBUF_BUFG : in STD_LOGIC;
    start_bot : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \height_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \state_reg[0]_1\ : in STD_LOGIC;
    state180_out : in STD_LOGIC;
    state172_out : in STD_LOGIC;
    \state_reg[0]_2\ : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \state_reg[2]\ : in STD_LOGIC;
    o_end_reg_1 : in STD_LOGIC;
    \state_reg[1]_0\ : in STD_LOGIC;
    i_start_IBUF : in STD_LOGIC;
    state176_out : in STD_LOGIC;
    \threshold_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \o_y_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_clk : in STD_LOGIC
  );
end comp_bot;

architecture STRUCTURE of comp_bot is
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5__0_n_0\ : STD_LOGIC;
  signal \o_address[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[10]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[11]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[12]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[13]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[14]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_6__0_n_0\ : STD_LOGIC;
  signal \o_address[1]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[4]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[5]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[6]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[7]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[8]_i_1_n_0\ : STD_LOGIC;
  signal \o_address[9]_i_1_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_1_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_5_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_5_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_1\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_4\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_5\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_6\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2_n_7\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \^o_done_reg\ : STD_LOGIC;
  signal o_en_i_3_n_0 : STD_LOGIC;
  signal \o_end_i_1__2_n_0\ : STD_LOGIC;
  signal \^o_end_reg_0\ : STD_LOGIC;
  signal \o_y[7]_i_1__0_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \plusOp__2\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal \^real_height_reg[7]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal state1 : STD_LOGIC;
  signal \^state174_out\ : STD_LOGIC;
  signal state17_out : STD_LOGIC;
  signal \state[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \state[1]_i_1__1_n_0\ : STD_LOGIC;
  signal state_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tmp_address : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tmp_address0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \tmp_address0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__0_n_1\ : STD_LOGIC;
  signal \tmp_address0_carry__0_n_2\ : STD_LOGIC;
  signal \tmp_address0_carry__0_n_3\ : STD_LOGIC;
  signal \tmp_address0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__1_n_1\ : STD_LOGIC;
  signal \tmp_address0_carry__1_n_2\ : STD_LOGIC;
  signal \tmp_address0_carry__1_n_3\ : STD_LOGIC;
  signal \tmp_address0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address0_carry__2_n_2\ : STD_LOGIC;
  signal \tmp_address0_carry__2_n_3\ : STD_LOGIC;
  signal tmp_address0_carry_i_1_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_2_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_3_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_4_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_5_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_6_n_0 : STD_LOGIC;
  signal tmp_address0_carry_i_7_n_0 : STD_LOGIC;
  signal tmp_address0_carry_n_0 : STD_LOGIC;
  signal tmp_address0_carry_n_1 : STD_LOGIC;
  signal tmp_address0_carry_n_2 : STD_LOGIC;
  signal tmp_address0_carry_n_3 : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \tmp_address0_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \tmp_address[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[10]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[11]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[13]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[14]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address[1]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[2]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[5]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[6]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address[9]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_5_n_0\ : STD_LOGIC;
  signal tmp_area_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tmp_area_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal x : STD_LOGIC;
  signal \x[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \x[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \x_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal y : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \y[6]_i_2_n_0\ : STD_LOGIC;
  signal \y[7]_i_2__2_n_0\ : STD_LOGIC;
  signal y_bot : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \y_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_o_area_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_plusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_address0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_tmp_address0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_address0_inferred__0/i__carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_area_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_address[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \o_address[10]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \o_address[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_address[12]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_address[13]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_address[14]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_address[15]_i_2__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_address[15]_i_5__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_address[15]_i_5__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_address[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_address[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_address[2]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_address[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_address[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_address[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_address[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_address[7]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_address[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_address[9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state[0]_i_1__2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \tmp_address[15]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \x[0]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \x[1]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \x[2]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \x[3]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \x[4]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \x[6]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \x[7]_i_3__0\ : label is "soft_lutpair13";
begin
  o_done_reg <= \^o_done_reg\;
  o_end_reg_0 <= \^o_end_reg_0\;
  \real_height_reg[7]\(6 downto 0) <= \^real_height_reg[7]\(6 downto 0);
  state174_out <= \^state174_out\;
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \total_area_reg[15]\(6),
      I1 => Q(6),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \total_area_reg[15]\(5),
      I1 => Q(5),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \total_area_reg[15]\(4),
      I1 => Q(4),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \total_area_reg[15]\(3),
      I1 => Q(3),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(6),
      I1 => \total_area_reg[15]\(6),
      I2 => Q(7),
      I3 => \total_area_reg[15]\(7),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(5),
      I1 => \total_area_reg[15]\(5),
      I2 => Q(6),
      I3 => \total_area_reg[15]\(6),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(4),
      I1 => \total_area_reg[15]\(4),
      I2 => Q(5),
      I3 => \total_area_reg[15]\(5),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(3),
      I1 => \total_area_reg[15]\(3),
      I2 => Q(4),
      I3 => \total_area_reg[15]\(4),
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \total_area_reg[15]\(7),
      I1 => Q(7),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(10),
      I1 => \total_area_reg[15]\(11),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(9),
      I1 => \total_area_reg[15]\(10),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(8),
      I1 => \total_area_reg[15]\(9),
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => Q(7),
      I1 => \total_area_reg[15]\(7),
      I2 => \total_area_reg[15]\(8),
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(14),
      I1 => \total_area_reg[15]\(15),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(13),
      I1 => \total_area_reg[15]\(14),
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(12),
      I1 => \total_area_reg[15]\(13),
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(11),
      I1 => \total_area_reg[15]\(12),
      O => \i__carry__2_i_4_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \threshold_reg[7]\(6),
      I1 => D(6),
      I2 => D(7),
      I3 => \threshold_reg[7]\(7),
      O => DI(3)
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(2),
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \threshold_reg[7]\(4),
      I1 => D(4),
      I2 => D(5),
      I3 => \threshold_reg[7]\(5),
      O => DI(2)
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => \total_area_reg[15]\(3),
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \threshold_reg[7]\(2),
      I1 => D(2),
      I2 => D(3),
      I3 => \threshold_reg[7]\(3),
      O => DI(1)
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(2),
      I1 => \total_area_reg[15]\(2),
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \threshold_reg[7]\(0),
      I1 => D(0),
      I2 => D(1),
      I3 => \threshold_reg[7]\(1),
      O => DI(0)
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(1),
      I1 => Q(1),
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => D(7),
      I1 => \threshold_reg[7]\(7),
      I2 => D(6),
      I3 => \threshold_reg[7]\(6),
      O => S(3)
    );
\i__carry_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(0),
      I1 => Q(0),
      O => \i__carry_i_5__0_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => D(5),
      I1 => \threshold_reg[7]\(5),
      I2 => D(4),
      I3 => \threshold_reg[7]\(4),
      O => S(2)
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => D(3),
      I1 => \threshold_reg[7]\(3),
      I2 => D(2),
      I3 => \threshold_reg[7]\(2),
      O => S(1)
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => D(1),
      I1 => \threshold_reg[7]\(1),
      I2 => D(0),
      I3 => \threshold_reg[7]\(0),
      O => S(0)
    );
\o_address[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(0),
      I1 => state17_out,
      O => \o_address[0]_i_1_n_0\
    );
\o_address[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(10),
      I1 => state17_out,
      I2 => plusOp(10),
      O => \o_address[10]_i_1_n_0\
    );
\o_address[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(11),
      I1 => state17_out,
      I2 => plusOp(11),
      O => \o_address[11]_i_1_n_0\
    );
\o_address[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(12),
      I1 => state17_out,
      I2 => plusOp(12),
      O => \o_address[12]_i_1_n_0\
    );
\o_address[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(13),
      I1 => state17_out,
      I2 => plusOp(13),
      O => \o_address[13]_i_1_n_0\
    );
\o_address[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(14),
      I1 => state17_out,
      I2 => plusOp(14),
      O => \o_address[14]_i_1_n_0\
    );
\o_address[15]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5551555105000000"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => start_bot,
      I2 => state_0(1),
      I3 => state_0(0),
      I4 => CO(0),
      I5 => state17_out,
      O => \o_address[15]_i_1__1_n_0\
    );
\o_address[15]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(15),
      I1 => state17_out,
      I2 => plusOp(15),
      O => \o_address[15]_i_2__0_n_0\
    );
\o_address[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => \o_address[15]_i_4__0_n_0\,
      I1 => \x_reg__0\(5),
      I2 => Q(5),
      I3 => \x_reg__0\(2),
      I4 => Q(2),
      I5 => \o_address[15]_i_5__0_n_0\,
      O => state17_out
    );
\o_address[15]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4004000000004004"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => Q(6),
      I3 => \x_reg__0\(6),
      I4 => Q(7),
      I5 => \x_reg__0\(7),
      O => \o_address[15]_i_4__0_n_0\
    );
\o_address[15]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => Q(0),
      I1 => \x_reg__0\(0),
      I2 => Q(1),
      I3 => \x_reg__0\(1),
      I4 => \o_address[15]_i_6__0_n_0\,
      O => \o_address[15]_i_5__0_n_0\
    );
\o_address[15]_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44004000"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => \^o_end_reg_0\,
      I3 => state(1),
      I4 => state(0),
      O => \o_address_reg[3]_1\
    );
\o_address[15]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \x_reg__0\(4),
      I1 => Q(4),
      I2 => \x_reg__0\(3),
      I3 => Q(3),
      O => \o_address[15]_i_6__0_n_0\
    );
\o_address[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(1),
      I1 => state17_out,
      I2 => plusOp(1),
      O => \o_address[1]_i_1_n_0\
    );
\o_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(2),
      I1 => state17_out,
      I2 => plusOp(2),
      O => \o_address[2]_i_1_n_0\
    );
\o_address[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state_reg[0]_1\,
      I1 => \^state174_out\,
      I2 => state180_out,
      I3 => state172_out,
      I4 => \state_reg[0]_2\,
      O => \o_address_reg[3]_0\
    );
\o_address[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \^o_end_reg_0\,
      I3 => state(2),
      I4 => state(3),
      O => \^state174_out\
    );
\o_address[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(3),
      I1 => state17_out,
      I2 => plusOp(3),
      O => \o_address[3]_i_1_n_0\
    );
\o_address[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(4),
      I1 => state17_out,
      I2 => plusOp(4),
      O => \o_address[4]_i_1_n_0\
    );
\o_address[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(5),
      I1 => state17_out,
      I2 => plusOp(5),
      O => \o_address[5]_i_1_n_0\
    );
\o_address[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(6),
      I1 => state17_out,
      I2 => plusOp(6),
      O => \o_address[6]_i_1_n_0\
    );
\o_address[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(7),
      I1 => state17_out,
      I2 => plusOp(7),
      O => \o_address[7]_i_1_n_0\
    );
\o_address[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(8),
      I1 => state17_out,
      I2 => plusOp(8),
      O => \o_address[8]_i_1_n_0\
    );
\o_address[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_address0(9),
      I1 => state17_out,
      I2 => plusOp(9),
      O => \o_address[9]_i_1_n_0\
    );
\o_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[0]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(0),
      R => '0'
    );
\o_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[10]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(10),
      R => '0'
    );
\o_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[11]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(11),
      R => '0'
    );
\o_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[12]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(12),
      R => '0'
    );
\o_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[13]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(13),
      R => '0'
    );
\o_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[14]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(14),
      R => '0'
    );
\o_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[15]_i_2__0_n_0\,
      Q => \o_address_reg[15]_0\(15),
      R => '0'
    );
\o_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[1]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(1),
      R => '0'
    );
\o_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[2]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(2),
      R => '0'
    );
\o_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[3]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(3),
      R => '0'
    );
\o_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[4]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(4),
      R => '0'
    );
\o_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[5]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(5),
      R => '0'
    );
\o_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[6]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(6),
      R => '0'
    );
\o_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[7]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(7),
      R => '0'
    );
\o_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[8]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(8),
      R => '0'
    );
\o_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__1_n_0\,
      D => \o_address[9]_i_1_n_0\,
      Q => \o_address_reg[15]_0\(9),
      R => '0'
    );
\o_area[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA2"
    )
        port map (
      I0 => state17_out,
      I1 => start_bot,
      I2 => state_0(0),
      I3 => state_0(1),
      O => \o_area[15]_i_1_n_0\
    );
\o_area[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(3),
      I1 => Q(3),
      O => \o_area[3]_i_2_n_0\
    );
\o_area[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(2),
      I1 => Q(2),
      O => \o_area[3]_i_3_n_0\
    );
\o_area[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(1),
      I1 => Q(1),
      O => \o_area[3]_i_4_n_0\
    );
\o_area[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(0),
      I1 => Q(0),
      O => \o_area[3]_i_5_n_0\
    );
\o_area[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(7),
      I1 => Q(7),
      O => \o_area[7]_i_2_n_0\
    );
\o_area[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(6),
      I1 => Q(6),
      O => \o_area[7]_i_3_n_0\
    );
\o_area[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(5),
      I1 => Q(5),
      O => \o_area[7]_i_4_n_0\
    );
\o_area[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(4),
      I1 => Q(4),
      O => \o_area[7]_i_5_n_0\
    );
\o_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[3]_i_1_n_7\,
      Q => \tmp_area_reg[15]_0\(0),
      R => i_rst_IBUF
    );
\o_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[11]_i_1_n_5\,
      Q => \tmp_area_reg[15]_0\(10),
      R => i_rst_IBUF
    );
\o_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[11]_i_1_n_4\,
      Q => \tmp_area_reg[15]_0\(11),
      R => i_rst_IBUF
    );
\o_area_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[7]_i_1_n_0\,
      CO(3) => \o_area_reg[11]_i_1_n_0\,
      CO(2) => \o_area_reg[11]_i_1_n_1\,
      CO(1) => \o_area_reg[11]_i_1_n_2\,
      CO(0) => \o_area_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[11]_i_1_n_4\,
      O(2) => \o_area_reg[11]_i_1_n_5\,
      O(1) => \o_area_reg[11]_i_1_n_6\,
      O(0) => \o_area_reg[11]_i_1_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\o_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[15]_i_2_n_7\,
      Q => \tmp_area_reg[15]_0\(12),
      R => i_rst_IBUF
    );
\o_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[15]_i_2_n_6\,
      Q => \tmp_area_reg[15]_0\(13),
      R => i_rst_IBUF
    );
\o_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[15]_i_2_n_5\,
      Q => \tmp_area_reg[15]_0\(14),
      R => i_rst_IBUF
    );
\o_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[15]_i_2_n_4\,
      Q => \tmp_area_reg[15]_0\(15),
      R => i_rst_IBUF
    );
\o_area_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[11]_i_1_n_0\,
      CO(3) => \NLW_o_area_reg[15]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \o_area_reg[15]_i_2_n_1\,
      CO(1) => \o_area_reg[15]_i_2_n_2\,
      CO(0) => \o_area_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[15]_i_2_n_4\,
      O(2) => \o_area_reg[15]_i_2_n_5\,
      O(1) => \o_area_reg[15]_i_2_n_6\,
      O(0) => \o_area_reg[15]_i_2_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\o_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[3]_i_1_n_6\,
      Q => \tmp_area_reg[15]_0\(1),
      R => i_rst_IBUF
    );
\o_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[3]_i_1_n_5\,
      Q => \tmp_area_reg[15]_0\(2),
      R => i_rst_IBUF
    );
\o_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[3]_i_1_n_4\,
      Q => \tmp_area_reg[15]_0\(3),
      R => i_rst_IBUF
    );
\o_area_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \o_area_reg[3]_i_1_n_0\,
      CO(2) => \o_area_reg[3]_i_1_n_1\,
      CO(1) => \o_area_reg[3]_i_1_n_2\,
      CO(0) => \o_area_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(3 downto 0),
      O(3) => \o_area_reg[3]_i_1_n_4\,
      O(2) => \o_area_reg[3]_i_1_n_5\,
      O(1) => \o_area_reg[3]_i_1_n_6\,
      O(0) => \o_area_reg[3]_i_1_n_7\,
      S(3) => \o_area[3]_i_2_n_0\,
      S(2) => \o_area[3]_i_3_n_0\,
      S(1) => \o_area[3]_i_4_n_0\,
      S(0) => \o_area[3]_i_5_n_0\
    );
\o_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[7]_i_1_n_7\,
      Q => \tmp_area_reg[15]_0\(4),
      R => i_rst_IBUF
    );
\o_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[7]_i_1_n_6\,
      Q => \tmp_area_reg[15]_0\(5),
      R => i_rst_IBUF
    );
\o_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[7]_i_1_n_5\,
      Q => \tmp_area_reg[15]_0\(6),
      R => i_rst_IBUF
    );
\o_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[7]_i_1_n_4\,
      Q => \tmp_area_reg[15]_0\(7),
      R => i_rst_IBUF
    );
\o_area_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[3]_i_1_n_0\,
      CO(3) => \o_area_reg[7]_i_1_n_0\,
      CO(2) => \o_area_reg[7]_i_1_n_1\,
      CO(1) => \o_area_reg[7]_i_1_n_2\,
      CO(0) => \o_area_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(7 downto 4),
      O(3) => \o_area_reg[7]_i_1_n_4\,
      O(2) => \o_area_reg[7]_i_1_n_5\,
      O(1) => \o_area_reg[7]_i_1_n_6\,
      O(0) => \o_area_reg[7]_i_1_n_7\,
      S(3) => \o_area[7]_i_2_n_0\,
      S(2) => \o_area[7]_i_3_n_0\,
      S(1) => \o_area[7]_i_4_n_0\,
      S(0) => \o_area[7]_i_5_n_0\
    );
\o_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[11]_i_1_n_7\,
      Q => \tmp_area_reg[15]_0\(8),
      R => i_rst_IBUF
    );
\o_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1_n_0\,
      D => \o_area_reg[11]_i_1_n_6\,
      Q => \tmp_area_reg[15]_0\(9),
      R => i_rst_IBUF
    );
o_done_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^state174_out\,
      I1 => state176_out,
      I2 => state172_out,
      O => \^o_done_reg\
    );
o_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAAA"
    )
        port map (
      I0 => o_en_i_3_n_0,
      I1 => state(1),
      I2 => state(0),
      I3 => state(2),
      I4 => state(3),
      I5 => i_start_IBUF,
      O => o_en_reg
    );
o_en_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEFEEEF44400000"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(1),
      I3 => state(0),
      I4 => \tmp_area[15]_i_3_n_0\,
      I5 => state180_out,
      O => o_en_i_3_n_0
    );
\o_end_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => state17_out,
      I1 => CO(0),
      I2 => state_0(0),
      I3 => state_0(1),
      I4 => \^o_end_reg_0\,
      O => \o_end_i_1__2_n_0\
    );
o_end_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \o_end_i_1__2_n_0\,
      Q => \^o_end_reg_0\,
      R => i_rst_IBUF
    );
o_we_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAAA"
    )
        port map (
      I0 => o_en_i_3_n_0,
      I1 => state(1),
      I2 => state(0),
      I3 => state(2),
      I4 => state(3),
      I5 => i_start_IBUF,
      O => o_we_reg
    );
\o_y[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => state17_out,
      I1 => CO(0),
      I2 => state_0(0),
      I3 => state_0(1),
      O => \o_y[7]_i_1__0_n_0\
    );
\o_y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(0),
      Q => \^real_height_reg[7]\(0),
      R => i_rst_IBUF
    );
\o_y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(1),
      Q => \^real_height_reg[7]\(1),
      R => i_rst_IBUF
    );
\o_y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(2),
      Q => \^real_height_reg[7]\(2),
      R => i_rst_IBUF
    );
\o_y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(3),
      Q => \^real_height_reg[7]\(3),
      R => i_rst_IBUF
    );
\o_y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(4),
      Q => \^real_height_reg[7]\(4),
      R => i_rst_IBUF
    );
\o_y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(5),
      Q => \^real_height_reg[7]\(5),
      R => i_rst_IBUF
    );
\o_y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(6),
      Q => \^real_height_reg[7]\(6),
      R => i_rst_IBUF
    );
\o_y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_y[7]_i_1__0_n_0\,
      D => \y_reg__0\(7),
      Q => y_bot(7),
      R => i_rst_IBUF
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => tmp_address(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(4 downto 1),
      S(3 downto 0) => tmp_address(4 downto 1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(8 downto 5),
      S(3 downto 0) => tmp_address(8 downto 5)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(12 downto 9),
      S(3 downto 0) => tmp_address(12 downto 9)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3 downto 2) => \NLW_plusOp_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => plusOp(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => tmp_address(15 downto 13)
    );
\real_height0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => y_bot(7),
      I1 => \o_y_reg[7]_0\(7),
      O => \real_height_reg[7]_0\(3)
    );
\real_height0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(6),
      I1 => \o_y_reg[7]_0\(6),
      O => \real_height_reg[7]_0\(2)
    );
\real_height0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(5),
      I1 => \o_y_reg[7]_0\(5),
      O => \real_height_reg[7]_0\(1)
    );
\real_height0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(4),
      I1 => \o_y_reg[7]_0\(4),
      O => \real_height_reg[7]_0\(0)
    );
real_height0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(3),
      I1 => \o_y_reg[7]_0\(3),
      O => \real_height_reg[3]\(3)
    );
real_height0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(2),
      I1 => \o_y_reg[7]_0\(2),
      O => \real_height_reg[3]\(2)
    );
real_height0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(1),
      I1 => \o_y_reg[7]_0\(1),
      O => \real_height_reg[3]\(1)
    );
real_height0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^real_height_reg[7]\(0),
      I1 => \o_y_reg[7]_0\(0),
      O => \real_height_reg[3]\(0)
    );
\state[0]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00EEF0"
    )
        port map (
      I0 => state17_out,
      I1 => CO(0),
      I2 => start_bot,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \state[0]_i_1__2_n_0\
    );
\state[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABABAAAAABAA"
    )
        port map (
      I0 => \^state174_out\,
      I1 => state172_out,
      I2 => \state_reg[2]\,
      I3 => o_end_reg_1,
      I4 => state(0),
      I5 => state(1),
      O => \state_reg[0]_0\
    );
\state[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55550100"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => state17_out,
      I2 => CO(0),
      I3 => state_0(0),
      I4 => state_0(1),
      O => \state[1]_i_1__1_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[0]_i_1__2_n_0\,
      Q => state_0(0),
      R => i_rst_IBUF
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[1]_i_1__1_n_0\,
      Q => state_0(1),
      R => '0'
    );
tmp_address0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => tmp_address0_carry_n_0,
      CO(2) => tmp_address0_carry_n_1,
      CO(1) => tmp_address0_carry_n_2,
      CO(0) => tmp_address0_carry_n_3,
      CYINIT => '0',
      DI(3) => tmp_address0_carry_i_1_n_0,
      DI(2) => tmp_address0_carry_i_2_n_0,
      DI(1) => tmp_address0_carry_i_3_n_0,
      DI(0) => '0',
      O(3 downto 0) => tmp_address0(4 downto 1),
      S(3) => tmp_address0_carry_i_4_n_0,
      S(2) => tmp_address0_carry_i_5_n_0,
      S(1) => tmp_address0_carry_i_6_n_0,
      S(0) => tmp_address0_carry_i_7_n_0
    );
\tmp_address0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => tmp_address0_carry_n_0,
      CO(3) => \tmp_address0_carry__0_n_0\,
      CO(2) => \tmp_address0_carry__0_n_1\,
      CO(1) => \tmp_address0_carry__0_n_2\,
      CO(0) => \tmp_address0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_address0_carry__0_i_1_n_0\,
      DI(2) => \tmp_address0_carry__0_i_2_n_0\,
      DI(1) => \tmp_address0_carry__0_i_3_n_0\,
      DI(0) => \tmp_address0_carry__0_i_4_n_0\,
      O(3 downto 0) => tmp_address0(8 downto 5),
      S(3) => \tmp_address0_carry__0_i_5_n_0\,
      S(2) => \tmp_address0_carry__0_i_6_n_0\,
      S(1) => \tmp_address0_carry__0_i_7_n_0\,
      S(0) => \tmp_address0_carry__0_i_8_n_0\
    );
\tmp_address0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(7),
      I1 => Q(6),
      O => \tmp_address0_carry__0_i_1_n_0\
    );
\tmp_address0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(6),
      I1 => Q(5),
      O => \tmp_address0_carry__0_i_2_n_0\
    );
\tmp_address0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(5),
      I1 => Q(4),
      O => \tmp_address0_carry__0_i_3_n_0\
    );
\tmp_address0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(4),
      I1 => Q(3),
      O => \tmp_address0_carry__0_i_4_n_0\
    );
\tmp_address0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(6),
      I1 => tmp_address(7),
      I2 => Q(7),
      I3 => tmp_address(8),
      O => \tmp_address0_carry__0_i_5_n_0\
    );
\tmp_address0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(5),
      I1 => tmp_address(6),
      I2 => Q(6),
      I3 => tmp_address(7),
      O => \tmp_address0_carry__0_i_6_n_0\
    );
\tmp_address0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(4),
      I1 => tmp_address(5),
      I2 => Q(5),
      I3 => tmp_address(6),
      O => \tmp_address0_carry__0_i_7_n_0\
    );
\tmp_address0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(3),
      I1 => tmp_address(4),
      I2 => Q(4),
      I3 => tmp_address(5),
      O => \tmp_address0_carry__0_i_8_n_0\
    );
\tmp_address0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address0_carry__0_n_0\,
      CO(3) => \tmp_address0_carry__1_n_0\,
      CO(2) => \tmp_address0_carry__1_n_1\,
      CO(1) => \tmp_address0_carry__1_n_2\,
      CO(0) => \tmp_address0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => tmp_address(11 downto 9),
      DI(0) => \tmp_address0_carry__1_i_1_n_0\,
      O(3 downto 0) => tmp_address0(12 downto 9),
      S(3) => \tmp_address0_carry__1_i_2_n_0\,
      S(2) => \tmp_address0_carry__1_i_3_n_0\,
      S(1) => \tmp_address0_carry__1_i_4_n_0\,
      S(0) => \tmp_address0_carry__1_i_5_n_0\
    );
\tmp_address0_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(8),
      I1 => Q(7),
      O => \tmp_address0_carry__1_i_1_n_0\
    );
\tmp_address0_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(11),
      I1 => tmp_address(12),
      O => \tmp_address0_carry__1_i_2_n_0\
    );
\tmp_address0_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(10),
      I1 => tmp_address(11),
      O => \tmp_address0_carry__1_i_3_n_0\
    );
\tmp_address0_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(9),
      I1 => tmp_address(10),
      O => \tmp_address0_carry__1_i_4_n_0\
    );
\tmp_address0_carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4B"
    )
        port map (
      I0 => Q(7),
      I1 => tmp_address(8),
      I2 => tmp_address(9),
      O => \tmp_address0_carry__1_i_5_n_0\
    );
\tmp_address0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address0_carry__1_n_0\,
      CO(3 downto 2) => \NLW_tmp_address0_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \tmp_address0_carry__2_n_2\,
      CO(0) => \tmp_address0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => tmp_address(13 downto 12),
      O(3) => \NLW_tmp_address0_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => tmp_address0(15 downto 13),
      S(3) => '0',
      S(2) => \tmp_address0_carry__2_i_1_n_0\,
      S(1) => \tmp_address0_carry__2_i_2_n_0\,
      S(0) => \tmp_address0_carry__2_i_3_n_0\
    );
\tmp_address0_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(14),
      I1 => tmp_address(15),
      O => \tmp_address0_carry__2_i_1_n_0\
    );
\tmp_address0_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(13),
      I1 => tmp_address(14),
      O => \tmp_address0_carry__2_i_2_n_0\
    );
\tmp_address0_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => tmp_address(12),
      I1 => tmp_address(13),
      O => \tmp_address0_carry__2_i_3_n_0\
    );
tmp_address0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(3),
      I1 => Q(2),
      O => tmp_address0_carry_i_1_n_0
    );
tmp_address0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tmp_address(2),
      I1 => Q(1),
      O => tmp_address0_carry_i_2_n_0
    );
tmp_address0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => tmp_address(1),
      I1 => Q(0),
      O => tmp_address0_carry_i_3_n_0
    );
tmp_address0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(2),
      I1 => tmp_address(3),
      I2 => Q(3),
      I3 => tmp_address(4),
      O => tmp_address0_carry_i_4_n_0
    );
tmp_address0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => Q(1),
      I1 => tmp_address(2),
      I2 => Q(2),
      I3 => tmp_address(3),
      O => tmp_address0_carry_i_5_n_0
    );
tmp_address0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2DD2"
    )
        port map (
      I0 => Q(0),
      I1 => tmp_address(1),
      I2 => Q(1),
      I3 => tmp_address(2),
      O => tmp_address0_carry_i_6_n_0
    );
tmp_address0_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_address(1),
      I1 => Q(0),
      O => tmp_address0_carry_i_7_n_0
    );
\tmp_address0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_address0_inferred__0/i__carry_n_0\,
      CO(2) => \tmp_address0_inferred__0/i__carry_n_1\,
      CO(1) => \tmp_address0_inferred__0/i__carry_n_2\,
      CO(0) => \tmp_address0_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \i__carry_i_1__0_n_0\,
      DI(2) => Q(2),
      DI(1 downto 0) => \total_area_reg[15]\(1 downto 0),
      O(3) => \tmp_address0_inferred__0/i__carry_n_4\,
      O(2) => \tmp_address0_inferred__0/i__carry_n_5\,
      O(1) => \tmp_address0_inferred__0/i__carry_n_6\,
      O(0) => \tmp_address0_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_2__0_n_0\,
      S(2) => \i__carry_i_3__0_n_0\,
      S(1) => \i__carry_i_4__0_n_0\,
      S(0) => \i__carry_i_5__0_n_0\
    );
\tmp_address0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address0_inferred__0/i__carry_n_0\,
      CO(3) => \tmp_address0_inferred__0/i__carry__0_n_0\,
      CO(2) => \tmp_address0_inferred__0/i__carry__0_n_1\,
      CO(1) => \tmp_address0_inferred__0/i__carry__0_n_2\,
      CO(0) => \tmp_address0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__0_i_1_n_0\,
      DI(2) => \i__carry__0_i_2_n_0\,
      DI(1) => \i__carry__0_i_3_n_0\,
      DI(0) => \i__carry__0_i_4_n_0\,
      O(3) => \tmp_address0_inferred__0/i__carry__0_n_4\,
      O(2) => \tmp_address0_inferred__0/i__carry__0_n_5\,
      O(1) => \tmp_address0_inferred__0/i__carry__0_n_6\,
      O(0) => \tmp_address0_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\tmp_address0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address0_inferred__0/i__carry__0_n_0\,
      CO(3) => \tmp_address0_inferred__0/i__carry__1_n_0\,
      CO(2) => \tmp_address0_inferred__0/i__carry__1_n_1\,
      CO(1) => \tmp_address0_inferred__0/i__carry__1_n_2\,
      CO(0) => \tmp_address0_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => \total_area_reg[15]\(10 downto 8),
      DI(0) => \i__carry__1_i_1_n_0\,
      O(3) => \tmp_address0_inferred__0/i__carry__1_n_4\,
      O(2) => \tmp_address0_inferred__0/i__carry__1_n_5\,
      O(1) => \tmp_address0_inferred__0/i__carry__1_n_6\,
      O(0) => \tmp_address0_inferred__0/i__carry__1_n_7\,
      S(3) => \i__carry__1_i_2_n_0\,
      S(2) => \i__carry__1_i_3_n_0\,
      S(1) => \i__carry__1_i_4_n_0\,
      S(0) => \i__carry__1_i_5_n_0\
    );
\tmp_address0_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address0_inferred__0/i__carry__1_n_0\,
      CO(3) => \NLW_tmp_address0_inferred__0/i__carry__2_CO_UNCONNECTED\(3),
      CO(2) => \tmp_address0_inferred__0/i__carry__2_n_1\,
      CO(1) => \tmp_address0_inferred__0/i__carry__2_n_2\,
      CO(0) => \tmp_address0_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \total_area_reg[15]\(13 downto 11),
      O(3) => \tmp_address0_inferred__0/i__carry__2_n_4\,
      O(2) => \tmp_address0_inferred__0/i__carry__2_n_5\,
      O(1) => \tmp_address0_inferred__0/i__carry__2_n_6\,
      O(0) => \tmp_address0_inferred__0/i__carry__2_n_7\,
      S(3) => \i__carry__2_i_1_n_0\,
      S(2) => \i__carry__2_i_2_n_0\,
      S(1) => \i__carry__2_i_3_n_0\,
      S(0) => \i__carry__2_i_4_n_0\
    );
\tmp_address[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFF02000200FEFF"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry_n_7\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_bot,
      I4 => tmp_address(0),
      I5 => state17_out,
      O => \tmp_address[0]_i_1__0_n_0\
    );
\tmp_address[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__1_n_5\,
      I1 => state1,
      I2 => tmp_address0(10),
      I3 => state17_out,
      I4 => plusOp(10),
      O => \tmp_address[10]_i_1_n_0\
    );
\tmp_address[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__1_n_4\,
      I1 => state1,
      I2 => tmp_address0(11),
      I3 => state17_out,
      I4 => plusOp(11),
      O => \tmp_address[11]_i_1_n_0\
    );
\tmp_address[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__2_n_7\,
      I1 => state1,
      I2 => tmp_address0(12),
      I3 => state17_out,
      I4 => plusOp(12),
      O => \tmp_address[12]_i_1_n_0\
    );
\tmp_address[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__2_n_6\,
      I1 => state1,
      I2 => tmp_address0(13),
      I3 => state17_out,
      I4 => plusOp(13),
      O => \tmp_address[13]_i_1_n_0\
    );
\tmp_address[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__2_n_5\,
      I1 => state1,
      I2 => tmp_address0(14),
      I3 => state17_out,
      I4 => plusOp(14),
      O => \tmp_address[14]_i_1_n_0\
    );
\tmp_address[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030303033303232"
    )
        port map (
      I0 => start_bot,
      I1 => i_rst_IBUF,
      I2 => state17_out,
      I3 => CO(0),
      I4 => state_0(0),
      I5 => state_0(1),
      O => \tmp_address[15]_i_1_n_0\
    );
\tmp_address[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__2_n_4\,
      I1 => state1,
      I2 => tmp_address0(15),
      I3 => state17_out,
      I4 => plusOp(15),
      O => \tmp_address[15]_i_2_n_0\
    );
\tmp_address[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => start_bot,
      O => state1
    );
\tmp_address[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry_n_6\,
      I1 => state1,
      I2 => tmp_address0(1),
      I3 => state17_out,
      I4 => plusOp(1),
      O => \tmp_address[1]_i_1_n_0\
    );
\tmp_address[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry_n_5\,
      I1 => state1,
      I2 => tmp_address0(2),
      I3 => state17_out,
      I4 => plusOp(2),
      O => \tmp_address[2]_i_1_n_0\
    );
\tmp_address[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry_n_4\,
      I1 => state1,
      I2 => tmp_address0(3),
      I3 => state17_out,
      I4 => plusOp(3),
      O => \tmp_address[3]_i_1_n_0\
    );
\tmp_address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__0_n_7\,
      I1 => state1,
      I2 => tmp_address0(4),
      I3 => state17_out,
      I4 => plusOp(4),
      O => \tmp_address[4]_i_1_n_0\
    );
\tmp_address[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__0_n_6\,
      I1 => state1,
      I2 => tmp_address0(5),
      I3 => state17_out,
      I4 => plusOp(5),
      O => \tmp_address[5]_i_1_n_0\
    );
\tmp_address[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__0_n_5\,
      I1 => state1,
      I2 => tmp_address0(6),
      I3 => state17_out,
      I4 => plusOp(6),
      O => \tmp_address[6]_i_1_n_0\
    );
\tmp_address[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__0_n_4\,
      I1 => state1,
      I2 => tmp_address0(7),
      I3 => state17_out,
      I4 => plusOp(7),
      O => \tmp_address[7]_i_1_n_0\
    );
\tmp_address[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__1_n_7\,
      I1 => state1,
      I2 => tmp_address0(8),
      I3 => state17_out,
      I4 => plusOp(8),
      O => \tmp_address[8]_i_1_n_0\
    );
\tmp_address[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \tmp_address0_inferred__0/i__carry__1_n_6\,
      I1 => state1,
      I2 => tmp_address0(9),
      I3 => state17_out,
      I4 => plusOp(9),
      O => \tmp_address[9]_i_1_n_0\
    );
\tmp_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[0]_i_1__0_n_0\,
      Q => tmp_address(0),
      R => '0'
    );
\tmp_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[10]_i_1_n_0\,
      Q => tmp_address(10),
      R => '0'
    );
\tmp_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[11]_i_1_n_0\,
      Q => tmp_address(11),
      R => '0'
    );
\tmp_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[12]_i_1_n_0\,
      Q => tmp_address(12),
      R => '0'
    );
\tmp_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[13]_i_1_n_0\,
      Q => tmp_address(13),
      R => '0'
    );
\tmp_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[14]_i_1_n_0\,
      Q => tmp_address(14),
      R => '0'
    );
\tmp_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[15]_i_2_n_0\,
      Q => tmp_address(15),
      R => '0'
    );
\tmp_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[1]_i_1_n_0\,
      Q => tmp_address(1),
      R => '0'
    );
\tmp_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[2]_i_1_n_0\,
      Q => tmp_address(2),
      R => '0'
    );
\tmp_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[3]_i_1_n_0\,
      Q => tmp_address(3),
      R => '0'
    );
\tmp_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[4]_i_1_n_0\,
      Q => tmp_address(4),
      R => '0'
    );
\tmp_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[5]_i_1_n_0\,
      Q => tmp_address(5),
      R => '0'
    );
\tmp_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[6]_i_1_n_0\,
      Q => tmp_address(6),
      R => '0'
    );
\tmp_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[7]_i_1_n_0\,
      Q => tmp_address(7),
      R => '0'
    );
\tmp_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[8]_i_1_n_0\,
      Q => tmp_address(8),
      R => '0'
    );
\tmp_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \tmp_address[15]_i_1_n_0\,
      D => \tmp_address[9]_i_1_n_0\,
      Q => tmp_address(9),
      R => '0'
    );
\tmp_area[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => start_bot,
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => \tmp_area[0]_i_1_n_0\
    );
\tmp_area[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state17_out,
      I1 => i_rst_IBUF,
      O => \tmp_area[0]_i_2__0_n_0\
    );
\tmp_area[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(3),
      I1 => tmp_area_reg(3),
      O => \tmp_area[0]_i_4_n_0\
    );
\tmp_area[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(2),
      I1 => tmp_area_reg(2),
      O => \tmp_area[0]_i_5_n_0\
    );
\tmp_area[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(1),
      I1 => tmp_area_reg(1),
      O => \tmp_area[0]_i_6_n_0\
    );
\tmp_area[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(0),
      I1 => tmp_area_reg(0),
      O => \tmp_area[0]_i_7_n_0\
    );
\tmp_area[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111110001"
    )
        port map (
      I0 => \state_reg[1]_0\,
      I1 => \tmp_area[15]_i_3_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => E(0)
    );
\tmp_area[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555554555555"
    )
        port map (
      I0 => \^o_done_reg\,
      I1 => state(1),
      I2 => state(0),
      I3 => o_end_reg_1,
      I4 => state(3),
      I5 => state(2),
      O => \tmp_area[15]_i_3_n_0\
    );
\tmp_area[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(7),
      I1 => tmp_area_reg(7),
      O => \tmp_area[4]_i_2_n_0\
    );
\tmp_area[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(6),
      I1 => tmp_area_reg(6),
      O => \tmp_area[4]_i_3_n_0\
    );
\tmp_area[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(5),
      I1 => tmp_area_reg(5),
      O => \tmp_area[4]_i_4_n_0\
    );
\tmp_area[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(4),
      I1 => tmp_area_reg(4),
      O => \tmp_area[4]_i_5_n_0\
    );
\tmp_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[0]_i_3_n_7\,
      Q => tmp_area_reg(0),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_area_reg[0]_i_3_n_0\,
      CO(2) => \tmp_area_reg[0]_i_3_n_1\,
      CO(1) => \tmp_area_reg[0]_i_3_n_2\,
      CO(0) => \tmp_area_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Q(3 downto 0),
      O(3) => \tmp_area_reg[0]_i_3_n_4\,
      O(2) => \tmp_area_reg[0]_i_3_n_5\,
      O(1) => \tmp_area_reg[0]_i_3_n_6\,
      O(0) => \tmp_area_reg[0]_i_3_n_7\,
      S(3) => \tmp_area[0]_i_4_n_0\,
      S(2) => \tmp_area[0]_i_5_n_0\,
      S(1) => \tmp_area[0]_i_6_n_0\,
      S(0) => \tmp_area[0]_i_7_n_0\
    );
\tmp_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[8]_i_1_n_5\,
      Q => tmp_area_reg(10),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[8]_i_1_n_4\,
      Q => tmp_area_reg(11),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[12]_i_1_n_7\,
      Q => tmp_area_reg(12),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[8]_i_1_n_0\,
      CO(3) => \NLW_tmp_area_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \tmp_area_reg[12]_i_1_n_1\,
      CO(1) => \tmp_area_reg[12]_i_1_n_2\,
      CO(0) => \tmp_area_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[12]_i_1_n_4\,
      O(2) => \tmp_area_reg[12]_i_1_n_5\,
      O(1) => \tmp_area_reg[12]_i_1_n_6\,
      O(0) => \tmp_area_reg[12]_i_1_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\tmp_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[12]_i_1_n_6\,
      Q => tmp_area_reg(13),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[12]_i_1_n_5\,
      Q => tmp_area_reg(14),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[12]_i_1_n_4\,
      Q => tmp_area_reg(15),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[0]_i_3_n_6\,
      Q => tmp_area_reg(1),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[0]_i_3_n_5\,
      Q => tmp_area_reg(2),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[0]_i_3_n_4\,
      Q => tmp_area_reg(3),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[4]_i_1_n_7\,
      Q => tmp_area_reg(4),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[0]_i_3_n_0\,
      CO(3) => \tmp_area_reg[4]_i_1_n_0\,
      CO(2) => \tmp_area_reg[4]_i_1_n_1\,
      CO(1) => \tmp_area_reg[4]_i_1_n_2\,
      CO(0) => \tmp_area_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Q(7 downto 4),
      O(3) => \tmp_area_reg[4]_i_1_n_4\,
      O(2) => \tmp_area_reg[4]_i_1_n_5\,
      O(1) => \tmp_area_reg[4]_i_1_n_6\,
      O(0) => \tmp_area_reg[4]_i_1_n_7\,
      S(3) => \tmp_area[4]_i_2_n_0\,
      S(2) => \tmp_area[4]_i_3_n_0\,
      S(1) => \tmp_area[4]_i_4_n_0\,
      S(0) => \tmp_area[4]_i_5_n_0\
    );
\tmp_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[4]_i_1_n_6\,
      Q => tmp_area_reg(5),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[4]_i_1_n_5\,
      Q => tmp_area_reg(6),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[4]_i_1_n_4\,
      Q => tmp_area_reg(7),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[8]_i_1_n_7\,
      Q => tmp_area_reg(8),
      R => \tmp_area[0]_i_1_n_0\
    );
\tmp_area_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[4]_i_1_n_0\,
      CO(3) => \tmp_area_reg[8]_i_1_n_0\,
      CO(2) => \tmp_area_reg[8]_i_1_n_1\,
      CO(1) => \tmp_area_reg[8]_i_1_n_2\,
      CO(0) => \tmp_area_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[8]_i_1_n_4\,
      O(2) => \tmp_area_reg[8]_i_1_n_5\,
      O(1) => \tmp_area_reg[8]_i_1_n_6\,
      O(0) => \tmp_area_reg[8]_i_1_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\tmp_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => \tmp_area[0]_i_2__0_n_0\,
      D => \tmp_area_reg[8]_i_1_n_6\,
      Q => tmp_area_reg(9),
      R => \tmp_area[0]_i_1_n_0\
    );
\x[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \x_reg__0\(0),
      O => \plusOp__2\(0)
    );
\x[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_reg__0\(0),
      I1 => \x_reg__0\(1),
      O => \plusOp__2\(1)
    );
\x[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \x_reg__0\(0),
      I1 => \x_reg__0\(1),
      I2 => \x_reg__0\(2),
      O => \plusOp__2\(2)
    );
\x[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \x_reg__0\(1),
      I1 => \x_reg__0\(0),
      I2 => \x_reg__0\(2),
      I3 => \x_reg__0\(3),
      O => \plusOp__2\(3)
    );
\x[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \x_reg__0\(2),
      I1 => \x_reg__0\(0),
      I2 => \x_reg__0\(1),
      I3 => \x_reg__0\(3),
      I4 => \x_reg__0\(4),
      O => \plusOp__2\(4)
    );
\x[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \x_reg__0\(3),
      I1 => \x_reg__0\(1),
      I2 => \x_reg__0\(0),
      I3 => \x_reg__0\(2),
      I4 => \x_reg__0\(4),
      I5 => \x_reg__0\(5),
      O => \plusOp__2\(5)
    );
\x[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x[7]_i_4__0_n_0\,
      I1 => \x_reg__0\(6),
      O => \plusOp__2\(6)
    );
\x[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22232222"
    )
        port map (
      I0 => state17_out,
      I1 => i_rst_IBUF,
      I2 => state_0(1),
      I3 => state_0(0),
      I4 => start_bot,
      O => \x[7]_i_1__0_n_0\
    );
\x[7]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => CO(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => x
    );
\x[7]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \x[7]_i_4__0_n_0\,
      I1 => \x_reg__0\(6),
      I2 => \x_reg__0\(7),
      O => \plusOp__2\(7)
    );
\x[7]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \x_reg__0\(5),
      I1 => \x_reg__0\(3),
      I2 => \x_reg__0\(1),
      I3 => \x_reg__0\(0),
      I4 => \x_reg__0\(2),
      I5 => \x_reg__0\(4),
      O => \x[7]_i_4__0_n_0\
    );
\x_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(0),
      Q => \x_reg__0\(0),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(1),
      Q => \x_reg__0\(1),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(2),
      Q => \x_reg__0\(2),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(3),
      Q => \x_reg__0\(3),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(4),
      Q => \x_reg__0\(4),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(5),
      Q => \x_reg__0\(5),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(6),
      Q => \x_reg__0\(6),
      R => \x[7]_i_1__0_n_0\
    );
\x_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__2\(7),
      Q => \x_reg__0\(7),
      R => \x[7]_i_1__0_n_0\
    );
\y[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0200FEFF"
    )
        port map (
      I0 => \height_reg[7]\(0),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_bot,
      I4 => \y_reg__0\(0),
      O => y(0)
    );
\y[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999F999999909999"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => state_0(1),
      I3 => state_0(0),
      I4 => start_bot,
      I5 => \height_reg[7]\(1),
      O => y(1)
    );
\y[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA900A9"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(1),
      I3 => state1,
      I4 => \height_reg[7]\(2),
      O => y(2)
    );
\y[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFE010000FE01"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(3),
      I4 => state1,
      I5 => \height_reg[7]\(3),
      O => y(3)
    );
\y[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999F999999909999"
    )
        port map (
      I0 => \y_reg__0\(4),
      I1 => \y[6]_i_2_n_0\,
      I2 => state_0(1),
      I3 => state_0(0),
      I4 => start_bot,
      I5 => \height_reg[7]\(4),
      O => y(4)
    );
\y[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA900A9"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(4),
      I2 => \y[6]_i_2_n_0\,
      I3 => state1,
      I4 => \height_reg[7]\(5),
      O => y(5)
    );
\y[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA90000AAA9"
    )
        port map (
      I0 => \y_reg__0\(6),
      I1 => \y_reg__0\(5),
      I2 => \y[6]_i_2_n_0\,
      I3 => \y_reg__0\(4),
      I4 => state1,
      I5 => \height_reg[7]\(6),
      O => y(6)
    );
\y[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \y_reg__0\(3),
      I1 => \y_reg__0\(2),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(1),
      O => \y[6]_i_2_n_0\
    );
\y[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA900A9"
    )
        port map (
      I0 => \y_reg__0\(7),
      I1 => \y_reg__0\(6),
      I2 => \y[7]_i_2__2_n_0\,
      I3 => state1,
      I4 => \height_reg[7]\(7),
      O => y(7)
    );
\y[7]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \y_reg__0\(4),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(1),
      I5 => \y_reg__0\(5),
      O => \y[7]_i_2__2_n_0\
    );
\y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(0),
      Q => \y_reg__0\(0),
      R => '0'
    );
\y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(1),
      Q => \y_reg__0\(1),
      R => '0'
    );
\y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(2),
      Q => \y_reg__0\(2),
      R => '0'
    );
\y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(3),
      Q => \y_reg__0\(3),
      R => '0'
    );
\y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(4),
      Q => \y_reg__0\(4),
      R => '0'
    );
\y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(5),
      Q => \y_reg__0\(5),
      R => '0'
    );
\y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(6),
      Q => \y_reg__0\(6),
      R => '0'
    );
\y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_1__0_n_0\,
      D => y(7),
      Q => \y_reg__0\(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comp_lft is
  port (
    \o_address_reg[0]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 12 downto 0 );
    state172_out : out STD_LOGIC;
    \o_address_reg[1]\ : out STD_LOGIC;
    \o_address_reg[2]\ : out STD_LOGIC;
    \p_1_in__0\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \o_address_reg[3]\ : out STD_LOGIC;
    \tmp_area_reg[15]_0\ : out STD_LOGIC;
    \tmp_area_reg[3]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    i_clk : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    i_rst_IBUF : in STD_LOGIC;
    i_clk_IBUF_BUFG : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_lft : in STD_LOGIC;
    \state_reg[2]\ : in STD_LOGIC;
    state174_out : in STD_LOGIC;
    \o_address_reg[0]_0\ : in STD_LOGIC;
    \tmp_address_reg[2]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \o_address_reg[1]_0\ : in STD_LOGIC;
    \o_address_reg[2]_0\ : in STD_LOGIC;
    \o_area_reg[15]_0\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    state176_out : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \state_reg[0]_0\ : in STD_LOGIC;
    \width_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    I61 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \o_y_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \o_y_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end comp_lft;

architecture STRUCTURE of comp_lft is
  signal \^d\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal data : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal lft_address : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \o_area0__0\ : STD_LOGIC;
  signal o_area15_out : STD_LOGIC;
  signal \o_area[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_5_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_6_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_5_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_5_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_4\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_5\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_6\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__0_n_7\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_1\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_2\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_3\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_4\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_5\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_6\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__0_n_7\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_4\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_5\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_6\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__0_n_7\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_4\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_5\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_6\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__0_n_7\ : STD_LOGIC;
  signal \o_area_reg_n_0_[10]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[11]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[12]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[13]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[14]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[15]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[1]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[2]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[3]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[4]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[5]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[6]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[7]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[8]\ : STD_LOGIC;
  signal \o_area_reg_n_0_[9]\ : STD_LOGIC;
  signal \o_end_i_1__0_n_0\ : STD_LOGIC;
  signal o_end_reg_n_0 : STD_LOGIC;
  signal \plusOp__3\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__0_n_4\ : STD_LOGIC;
  signal \plusOp_carry__0_n_5\ : STD_LOGIC;
  signal \plusOp_carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_carry__0_n_7\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_4\ : STD_LOGIC;
  signal \plusOp_carry__1_n_5\ : STD_LOGIC;
  signal \plusOp_carry__1_n_6\ : STD_LOGIC;
  signal \plusOp_carry__1_n_7\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_5\ : STD_LOGIC;
  signal \plusOp_carry__2_n_6\ : STD_LOGIC;
  signal \plusOp_carry__2_n_7\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal plusOp_carry_n_4 : STD_LOGIC;
  signal plusOp_carry_n_5 : STD_LOGIC;
  signal plusOp_carry_n_6 : STD_LOGIC;
  signal plusOp_carry_n_7 : STD_LOGIC;
  signal real_height : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \real_height0_carry__0_n_1\ : STD_LOGIC;
  signal \real_height0_carry__0_n_2\ : STD_LOGIC;
  signal \real_height0_carry__0_n_3\ : STD_LOGIC;
  signal real_height0_carry_n_0 : STD_LOGIC;
  signal real_height0_carry_n_1 : STD_LOGIC;
  signal real_height0_carry_n_2 : STD_LOGIC;
  signal real_height0_carry_n_3 : STD_LOGIC;
  signal \real_height[7]_i_1_n_0\ : STD_LOGIC;
  signal \^state172_out\ : STD_LOGIC;
  signal \state[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \state[1]_i_1__2_n_0\ : STD_LOGIC;
  signal state_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tmp_address : STD_LOGIC;
  signal \tmp_address[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[13]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[14]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \tmp_address[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2_n_7\ : STD_LOGIC;
  signal tmp_area : STD_LOGIC;
  signal \tmp_area[0]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_5__1_n_0\ : STD_LOGIC;
  signal tmp_area_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tmp_area_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal y : STD_LOGIC;
  signal \y[7]_i_4_n_0\ : STD_LOGIC;
  signal \y_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zero : STD_LOGIC;
  signal \zero0_carry__0_n_0\ : STD_LOGIC;
  signal \zero0_carry__0_n_1\ : STD_LOGIC;
  signal \zero0_carry__0_n_2\ : STD_LOGIC;
  signal \zero0_carry__0_n_3\ : STD_LOGIC;
  signal \zero0_carry__1_n_0\ : STD_LOGIC;
  signal \zero0_carry__1_n_1\ : STD_LOGIC;
  signal \zero0_carry__1_n_2\ : STD_LOGIC;
  signal \zero0_carry__1_n_3\ : STD_LOGIC;
  signal \zero0_carry__2_n_2\ : STD_LOGIC;
  signal \zero0_carry__2_n_3\ : STD_LOGIC;
  signal zero0_carry_n_0 : STD_LOGIC;
  signal zero0_carry_n_1 : STD_LOGIC;
  signal zero0_carry_n_2 : STD_LOGIC;
  signal zero0_carry_n_3 : STD_LOGIC;
  signal \zero[0]_i_2_n_0\ : STD_LOGIC;
  signal \zero[0]_i_3_n_0\ : STD_LOGIC;
  signal \zero[0]_i_4_n_0\ : STD_LOGIC;
  signal \zero[0]_i_5_n_0\ : STD_LOGIC;
  signal \zero[0]_i_6_n_0\ : STD_LOGIC;
  signal \zero[12]_i_2_n_0\ : STD_LOGIC;
  signal \zero[12]_i_3_n_0\ : STD_LOGIC;
  signal \zero[12]_i_4_n_0\ : STD_LOGIC;
  signal \zero[12]_i_5_n_0\ : STD_LOGIC;
  signal \zero[4]_i_2_n_0\ : STD_LOGIC;
  signal \zero[4]_i_3_n_0\ : STD_LOGIC;
  signal \zero[4]_i_4_n_0\ : STD_LOGIC;
  signal \zero[4]_i_5_n_0\ : STD_LOGIC;
  signal \zero[8]_i_2_n_0\ : STD_LOGIC;
  signal \zero[8]_i_3_n_0\ : STD_LOGIC;
  signal \zero[8]_i_4_n_0\ : STD_LOGIC;
  signal \zero[8]_i_5_n_0\ : STD_LOGIC;
  signal zero_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \zero_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \zero_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \zero_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \zero_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \zero_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_o_area_reg[15]_i_2__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_plusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_real_height0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_address_reg[15]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_area_reg[12]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_zero0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_address[15]_i_3__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_address[2]_i_6\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_area[15]_i_5\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_end_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \state[1]_i_1__2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \tmp_address[15]_i_3__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \tmp_address[15]_i_5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \y[0]_i_1__1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \y[1]_i_1__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \y[2]_i_1__1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \y[3]_i_1__1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \y[4]_i_1__1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \y[6]_i_1__1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \y[7]_i_3__0\ : label is "soft_lutpair19";
begin
  D(7 downto 0) <= \^d\(7 downto 0);
  Q(12 downto 0) <= \^q\(12 downto 0);
  state172_out <= \^state172_out\;
\o_address[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF22372237"
    )
        port map (
      I0 => \state_reg[2]\,
      I1 => lft_address(0),
      I2 => state174_out,
      I3 => \o_address_reg[0]_0\,
      I4 => \tmp_address_reg[2]_0\(0),
      I5 => \^state172_out\,
      O => \o_address_reg[0]\
    );
\o_address[15]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000022"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => o_end_reg_n_0,
      I3 => state(0),
      I4 => state(1),
      O => \o_address_reg[3]\
    );
\o_address[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF22372237"
    )
        port map (
      I0 => \state_reg[2]\,
      I1 => lft_address(1),
      I2 => state174_out,
      I3 => \o_address_reg[1]_0\,
      I4 => \tmp_address_reg[2]_0\(1),
      I5 => \^state172_out\,
      O => \o_address_reg[1]\
    );
\o_address[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => o_end_reg_n_0,
      I3 => state(2),
      I4 => state(3),
      O => \^state172_out\
    );
\o_address[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF22372237"
    )
        port map (
      I0 => \state_reg[2]\,
      I1 => lft_address(2),
      I2 => state174_out,
      I3 => \o_address_reg[2]_0\,
      I4 => \tmp_address_reg[2]_0\(2),
      I5 => \^state172_out\,
      O => \o_address_reg[2]\
    );
\o_area[15]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA2"
    )
        port map (
      I0 => \o_area0__0\,
      I1 => start_lft,
      I2 => state_0(0),
      I3 => state_0(1),
      O => \o_area[15]_i_1__0_n_0\
    );
\o_area[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => \o_area[15]_i_4_n_0\,
      I1 => \y_reg__0\(5),
      I2 => real_height(5),
      I3 => \y_reg__0\(2),
      I4 => real_height(2),
      I5 => \o_area[15]_i_5_n_0\,
      O => \o_area0__0\
    );
\o_area[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4004000000004004"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => real_height(6),
      I3 => \y_reg__0\(6),
      I4 => real_height(7),
      I5 => \y_reg__0\(7),
      O => \o_area[15]_i_4_n_0\
    );
\o_area[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => real_height(0),
      I1 => \y_reg__0\(0),
      I2 => real_height(1),
      I3 => \y_reg__0\(1),
      I4 => \o_area[15]_i_6_n_0\,
      O => \o_area[15]_i_5_n_0\
    );
\o_area[15]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \y_reg__0\(4),
      I1 => real_height(4),
      I2 => \y_reg__0\(3),
      I3 => real_height(3),
      O => \o_area[15]_i_6_n_0\
    );
\o_area[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(3),
      I1 => real_height(3),
      O => \o_area[3]_i_2_n_0\
    );
\o_area[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(2),
      I1 => real_height(2),
      O => \o_area[3]_i_3_n_0\
    );
\o_area[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(1),
      I1 => real_height(1),
      O => \o_area[3]_i_4_n_0\
    );
\o_area[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(0),
      I1 => real_height(0),
      O => \o_area[3]_i_5_n_0\
    );
\o_area[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(7),
      I1 => real_height(7),
      O => \o_area[7]_i_2_n_0\
    );
\o_area[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(6),
      I1 => real_height(6),
      O => \o_area[7]_i_3_n_0\
    );
\o_area[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(5),
      I1 => real_height(5),
      O => \o_area[7]_i_4_n_0\
    );
\o_area[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(4),
      I1 => real_height(4),
      O => \o_area[7]_i_5_n_0\
    );
\o_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[3]_i_1__0_n_7\,
      Q => \tmp_area_reg[3]_0\(0),
      R => i_rst_IBUF
    );
\o_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[11]_i_1__0_n_5\,
      Q => \o_area_reg_n_0_[10]\,
      R => i_rst_IBUF
    );
\o_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[11]_i_1__0_n_4\,
      Q => \o_area_reg_n_0_[11]\,
      R => i_rst_IBUF
    );
\o_area_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[7]_i_1__0_n_0\,
      CO(3) => \o_area_reg[11]_i_1__0_n_0\,
      CO(2) => \o_area_reg[11]_i_1__0_n_1\,
      CO(1) => \o_area_reg[11]_i_1__0_n_2\,
      CO(0) => \o_area_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[11]_i_1__0_n_4\,
      O(2) => \o_area_reg[11]_i_1__0_n_5\,
      O(1) => \o_area_reg[11]_i_1__0_n_6\,
      O(0) => \o_area_reg[11]_i_1__0_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\o_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[15]_i_2__0_n_7\,
      Q => \o_area_reg_n_0_[12]\,
      R => i_rst_IBUF
    );
\o_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[15]_i_2__0_n_6\,
      Q => \o_area_reg_n_0_[13]\,
      R => i_rst_IBUF
    );
\o_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[15]_i_2__0_n_5\,
      Q => \o_area_reg_n_0_[14]\,
      R => i_rst_IBUF
    );
\o_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[15]_i_2__0_n_4\,
      Q => \o_area_reg_n_0_[15]\,
      R => i_rst_IBUF
    );
\o_area_reg[15]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[11]_i_1__0_n_0\,
      CO(3) => \NLW_o_area_reg[15]_i_2__0_CO_UNCONNECTED\(3),
      CO(2) => \o_area_reg[15]_i_2__0_n_1\,
      CO(1) => \o_area_reg[15]_i_2__0_n_2\,
      CO(0) => \o_area_reg[15]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[15]_i_2__0_n_4\,
      O(2) => \o_area_reg[15]_i_2__0_n_5\,
      O(1) => \o_area_reg[15]_i_2__0_n_6\,
      O(0) => \o_area_reg[15]_i_2__0_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\o_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[3]_i_1__0_n_6\,
      Q => \o_area_reg_n_0_[1]\,
      R => i_rst_IBUF
    );
\o_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[3]_i_1__0_n_5\,
      Q => \o_area_reg_n_0_[2]\,
      R => i_rst_IBUF
    );
\o_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[3]_i_1__0_n_4\,
      Q => \o_area_reg_n_0_[3]\,
      R => i_rst_IBUF
    );
\o_area_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \o_area_reg[3]_i_1__0_n_0\,
      CO(2) => \o_area_reg[3]_i_1__0_n_1\,
      CO(1) => \o_area_reg[3]_i_1__0_n_2\,
      CO(0) => \o_area_reg[3]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(3 downto 0),
      O(3) => \o_area_reg[3]_i_1__0_n_4\,
      O(2) => \o_area_reg[3]_i_1__0_n_5\,
      O(1) => \o_area_reg[3]_i_1__0_n_6\,
      O(0) => \o_area_reg[3]_i_1__0_n_7\,
      S(3) => \o_area[3]_i_2_n_0\,
      S(2) => \o_area[3]_i_3_n_0\,
      S(1) => \o_area[3]_i_4_n_0\,
      S(0) => \o_area[3]_i_5_n_0\
    );
\o_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[7]_i_1__0_n_7\,
      Q => \o_area_reg_n_0_[4]\,
      R => i_rst_IBUF
    );
\o_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[7]_i_1__0_n_6\,
      Q => \o_area_reg_n_0_[5]\,
      R => i_rst_IBUF
    );
\o_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[7]_i_1__0_n_5\,
      Q => \o_area_reg_n_0_[6]\,
      R => i_rst_IBUF
    );
\o_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[7]_i_1__0_n_4\,
      Q => \o_area_reg_n_0_[7]\,
      R => i_rst_IBUF
    );
\o_area_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[3]_i_1__0_n_0\,
      CO(3) => \o_area_reg[7]_i_1__0_n_0\,
      CO(2) => \o_area_reg[7]_i_1__0_n_1\,
      CO(1) => \o_area_reg[7]_i_1__0_n_2\,
      CO(0) => \o_area_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(7 downto 4),
      O(3) => \o_area_reg[7]_i_1__0_n_4\,
      O(2) => \o_area_reg[7]_i_1__0_n_5\,
      O(1) => \o_area_reg[7]_i_1__0_n_6\,
      O(0) => \o_area_reg[7]_i_1__0_n_7\,
      S(3) => \o_area[7]_i_2_n_0\,
      S(2) => \o_area[7]_i_3_n_0\,
      S(1) => \o_area[7]_i_4_n_0\,
      S(0) => \o_area[7]_i_5_n_0\
    );
\o_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[11]_i_1__0_n_7\,
      Q => \o_area_reg_n_0_[8]\,
      R => i_rst_IBUF
    );
\o_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__0_n_0\,
      D => \o_area_reg[11]_i_1__0_n_6\,
      Q => \o_area_reg_n_0_[9]\,
      R => i_rst_IBUF
    );
\o_end_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => \tmp_address[15]_i_3__0_n_0\,
      I1 => CO(0),
      I2 => state_0(0),
      I3 => state_0(1),
      I4 => o_end_reg_n_0,
      O => \o_end_i_1__0_n_0\
    );
o_end_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \o_end_i_1__0_n_0\,
      Q => o_end_reg_n_0,
      R => i_rst_IBUF
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => zero_reg(0),
      DI(3 downto 0) => B"0000",
      O(3) => plusOp_carry_n_4,
      O(2) => plusOp_carry_n_5,
      O(1) => plusOp_carry_n_6,
      O(0) => plusOp_carry_n_7,
      S(3 downto 0) => zero_reg(4 downto 1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_carry__0_n_4\,
      O(2) => \plusOp_carry__0_n_5\,
      O(1) => \plusOp_carry__0_n_6\,
      O(0) => \plusOp_carry__0_n_7\,
      S(3 downto 0) => zero_reg(8 downto 5)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_carry__1_n_4\,
      O(2) => \plusOp_carry__1_n_5\,
      O(1) => \plusOp_carry__1_n_6\,
      O(0) => \plusOp_carry__1_n_7\,
      S(3 downto 0) => zero_reg(12 downto 9)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3 downto 2) => \NLW_plusOp_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_carry__2_O_UNCONNECTED\(3),
      O(2) => \plusOp_carry__2_n_5\,
      O(1) => \plusOp_carry__2_n_6\,
      O(0) => \plusOp_carry__2_n_7\,
      S(3) => '0',
      S(2 downto 0) => zero_reg(15 downto 13)
    );
real_height0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => real_height0_carry_n_0,
      CO(2) => real_height0_carry_n_1,
      CO(1) => real_height0_carry_n_2,
      CO(0) => real_height0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => I61(3 downto 0),
      O(3 downto 0) => \^d\(3 downto 0),
      S(3 downto 0) => \o_y_reg[3]\(3 downto 0)
    );
\real_height0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => real_height0_carry_n_0,
      CO(3) => \NLW_real_height0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \real_height0_carry__0_n_1\,
      CO(1) => \real_height0_carry__0_n_2\,
      CO(0) => \real_height0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => I61(6 downto 4),
      O(3 downto 0) => \^d\(7 downto 4),
      S(3 downto 0) => \o_y_reg[7]\(3 downto 0)
    );
\real_height[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => start_lft,
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => \real_height[7]_i_1_n_0\
    );
\real_height_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(0),
      Q => real_height(0),
      R => '0'
    );
\real_height_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(1),
      Q => real_height(1),
      R => '0'
    );
\real_height_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(2),
      Q => real_height(2),
      R => '0'
    );
\real_height_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(3),
      Q => real_height(3),
      R => '0'
    );
\real_height_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(4),
      Q => real_height(4),
      R => '0'
    );
\real_height_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(5),
      Q => real_height(5),
      R => '0'
    );
\real_height_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(6),
      Q => real_height(6),
      R => '0'
    );
\real_height_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1_n_0\,
      D => \^d\(7),
      Q => real_height(7),
      R => '0'
    );
\state[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => \tmp_address[15]_i_3__0_n_0\,
      O => \state[0]_i_1__0_n_0\
    );
\state[1]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFC4"
    )
        port map (
      I0 => CO(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => \tmp_address[15]_i_3__0_n_0\,
      O => \state[1]_i_1__2_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[0]_i_1__0_n_0\,
      Q => state_0(0),
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[1]_i_1__2_n_0\,
      Q => state_0(1),
      R => i_rst_IBUF
    );
\tmp_address[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22F2FFFF22F222F2"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2_n_7\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => zero_reg(0),
      I4 => \out\(0),
      I5 => o_area15_out,
      O => \tmp_address[0]_i_1__1_n_0\
    );
\tmp_address[10]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2_n_5\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__1_n_6\,
      I4 => o_area15_out,
      I5 => data(10),
      O => \tmp_address[10]_i_1__0_n_0\
    );
\tmp_address[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2_n_4\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__1_n_5\,
      I4 => o_area15_out,
      I5 => data(11),
      O => \tmp_address[11]_i_1__0_n_0\
    );
\tmp_address[12]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4_n_7\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__1_n_4\,
      I4 => o_area15_out,
      I5 => data(12),
      O => \tmp_address[12]_i_1__0_n_0\
    );
\tmp_address[13]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4_n_6\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__2_n_7\,
      I4 => o_area15_out,
      I5 => data(13),
      O => \tmp_address[13]_i_1__0_n_0\
    );
\tmp_address[14]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4_n_5\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__2_n_6\,
      I4 => o_area15_out,
      I5 => data(14),
      O => \tmp_address[14]_i_1__0_n_0\
    );
\tmp_address[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF40"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => CO(0),
      I3 => \tmp_address[15]_i_3__0_n_0\,
      I4 => i_rst_IBUF,
      O => tmp_address
    );
\tmp_address[15]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4_n_4\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__2_n_5\,
      I4 => o_area15_out,
      I5 => data(15),
      O => \tmp_address[15]_i_2__0_n_0\
    );
\tmp_address[15]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
        port map (
      I0 => start_lft,
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => \o_area0__0\,
      O => \tmp_address[15]_i_3__0_n_0\
    );
\tmp_address[15]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => start_lft,
      O => o_area15_out
    );
\tmp_address[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2_n_6\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => plusOp_carry_n_7,
      I4 => o_area15_out,
      I5 => data(1),
      O => \tmp_address[1]_i_1__0_n_0\
    );
\tmp_address[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2_n_5\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => plusOp_carry_n_6,
      I4 => o_area15_out,
      I5 => data(2),
      O => \tmp_address[2]_i_1__0_n_0\
    );
\tmp_address[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2_n_4\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => plusOp_carry_n_5,
      I4 => o_area15_out,
      I5 => data(3),
      O => \tmp_address[3]_i_1__0_n_0\
    );
\tmp_address[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \width_reg[7]\(3),
      O => \tmp_address[3]_i_3_n_0\
    );
\tmp_address[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => lft_address(2),
      I1 => \width_reg[7]\(2),
      O => \tmp_address[3]_i_4_n_0\
    );
\tmp_address[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => lft_address(1),
      I1 => \width_reg[7]\(1),
      O => \tmp_address[3]_i_5_n_0\
    );
\tmp_address[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => lft_address(0),
      I1 => \width_reg[7]\(0),
      O => \tmp_address[3]_i_6_n_0\
    );
\tmp_address[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2_n_7\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => plusOp_carry_n_4,
      I4 => o_area15_out,
      I5 => data(4),
      O => \tmp_address[4]_i_1__0_n_0\
    );
\tmp_address[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2_n_6\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__0_n_7\,
      I4 => o_area15_out,
      I5 => data(5),
      O => \tmp_address[5]_i_1__0_n_0\
    );
\tmp_address[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2_n_5\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__0_n_6\,
      I4 => o_area15_out,
      I5 => data(6),
      O => \tmp_address[6]_i_1__0_n_0\
    );
\tmp_address[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2_n_4\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__0_n_5\,
      I4 => o_area15_out,
      I5 => data(7),
      O => \tmp_address[7]_i_1__0_n_0\
    );
\tmp_address[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => \width_reg[7]\(7),
      O => \tmp_address[7]_i_3_n_0\
    );
\tmp_address[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \width_reg[7]\(6),
      O => \tmp_address[7]_i_4_n_0\
    );
\tmp_address[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(2),
      I1 => \width_reg[7]\(5),
      O => \tmp_address[7]_i_5_n_0\
    );
\tmp_address[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(1),
      I1 => \width_reg[7]\(4),
      O => \tmp_address[7]_i_6_n_0\
    );
\tmp_address[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2_n_7\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__0_n_4\,
      I4 => o_area15_out,
      I5 => data(8),
      O => \tmp_address[8]_i_1__0_n_0\
    );
\tmp_address[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2_n_6\,
      I1 => \tmp_address[15]_i_3__0_n_0\,
      I2 => \o_area[15]_i_1__0_n_0\,
      I3 => \plusOp_carry__1_n_7\,
      I4 => o_area15_out,
      I5 => data(9),
      O => \tmp_address[9]_i_1__0_n_0\
    );
\tmp_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[0]_i_1__1_n_0\,
      Q => lft_address(0),
      R => '0'
    );
\tmp_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[10]_i_1__0_n_0\,
      Q => \^q\(7),
      R => '0'
    );
\tmp_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[11]_i_1__0_n_0\,
      Q => \^q\(8),
      R => '0'
    );
\tmp_address_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[7]_i_2_n_0\,
      CO(3) => \tmp_address_reg[11]_i_2_n_0\,
      CO(2) => \tmp_address_reg[11]_i_2_n_1\,
      CO(1) => \tmp_address_reg[11]_i_2_n_2\,
      CO(0) => \tmp_address_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[11]_i_2_n_4\,
      O(2) => \tmp_address_reg[11]_i_2_n_5\,
      O(1) => \tmp_address_reg[11]_i_2_n_6\,
      O(0) => \tmp_address_reg[11]_i_2_n_7\,
      S(3 downto 0) => \^q\(8 downto 5)
    );
\tmp_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[12]_i_1__0_n_0\,
      Q => \^q\(9),
      R => '0'
    );
\tmp_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[13]_i_1__0_n_0\,
      Q => \^q\(10),
      R => '0'
    );
\tmp_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[14]_i_1__0_n_0\,
      Q => \^q\(11),
      R => '0'
    );
\tmp_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[15]_i_2__0_n_0\,
      Q => \^q\(12),
      R => '0'
    );
\tmp_address_reg[15]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[11]_i_2_n_0\,
      CO(3) => \NLW_tmp_address_reg[15]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \tmp_address_reg[15]_i_4_n_1\,
      CO(1) => \tmp_address_reg[15]_i_4_n_2\,
      CO(0) => \tmp_address_reg[15]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[15]_i_4_n_4\,
      O(2) => \tmp_address_reg[15]_i_4_n_5\,
      O(1) => \tmp_address_reg[15]_i_4_n_6\,
      O(0) => \tmp_address_reg[15]_i_4_n_7\,
      S(3 downto 0) => \^q\(12 downto 9)
    );
\tmp_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[1]_i_1__0_n_0\,
      Q => lft_address(1),
      R => '0'
    );
\tmp_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[2]_i_1__0_n_0\,
      Q => lft_address(2),
      R => '0'
    );
\tmp_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[3]_i_1__0_n_0\,
      Q => \^q\(0),
      R => '0'
    );
\tmp_address_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_address_reg[3]_i_2_n_0\,
      CO(2) => \tmp_address_reg[3]_i_2_n_1\,
      CO(1) => \tmp_address_reg[3]_i_2_n_2\,
      CO(0) => \tmp_address_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \^q\(0),
      DI(2 downto 0) => lft_address(2 downto 0),
      O(3) => \tmp_address_reg[3]_i_2_n_4\,
      O(2) => \tmp_address_reg[3]_i_2_n_5\,
      O(1) => \tmp_address_reg[3]_i_2_n_6\,
      O(0) => \tmp_address_reg[3]_i_2_n_7\,
      S(3) => \tmp_address[3]_i_3_n_0\,
      S(2) => \tmp_address[3]_i_4_n_0\,
      S(1) => \tmp_address[3]_i_5_n_0\,
      S(0) => \tmp_address[3]_i_6_n_0\
    );
\tmp_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[4]_i_1__0_n_0\,
      Q => \^q\(1),
      R => '0'
    );
\tmp_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[5]_i_1__0_n_0\,
      Q => \^q\(2),
      R => '0'
    );
\tmp_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[6]_i_1__0_n_0\,
      Q => \^q\(3),
      R => '0'
    );
\tmp_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[7]_i_1__0_n_0\,
      Q => \^q\(4),
      R => '0'
    );
\tmp_address_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[3]_i_2_n_0\,
      CO(3) => \tmp_address_reg[7]_i_2_n_0\,
      CO(2) => \tmp_address_reg[7]_i_2_n_1\,
      CO(1) => \tmp_address_reg[7]_i_2_n_2\,
      CO(0) => \tmp_address_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(4 downto 1),
      O(3) => \tmp_address_reg[7]_i_2_n_4\,
      O(2) => \tmp_address_reg[7]_i_2_n_5\,
      O(1) => \tmp_address_reg[7]_i_2_n_6\,
      O(0) => \tmp_address_reg[7]_i_2_n_7\,
      S(3) => \tmp_address[7]_i_3_n_0\,
      S(2) => \tmp_address[7]_i_4_n_0\,
      S(1) => \tmp_address[7]_i_5_n_0\,
      S(0) => \tmp_address[7]_i_6_n_0\
    );
\tmp_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[8]_i_1__0_n_0\,
      Q => \^q\(5),
      R => '0'
    );
\tmp_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[9]_i_1__0_n_0\,
      Q => \^q\(6),
      R => '0'
    );
\tmp_area[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \o_area0__0\,
      I1 => i_rst_IBUF,
      O => tmp_area
    );
\tmp_area[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(3),
      I1 => tmp_area_reg(3),
      O => \tmp_area[0]_i_3_n_0\
    );
\tmp_area[0]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(2),
      I1 => tmp_area_reg(2),
      O => \tmp_area[0]_i_4__1_n_0\
    );
\tmp_area[0]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(1),
      I1 => tmp_area_reg(1),
      O => \tmp_area[0]_i_5__1_n_0\
    );
\tmp_area[0]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(0),
      I1 => tmp_area_reg(0),
      O => \tmp_area[0]_i_6__0_n_0\
    );
\tmp_area[11]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(9),
      I3 => \o_area_reg_n_0_[10]\,
      I4 => \out\(10),
      I5 => state176_out,
      O => \p_1_in__0\(9)
    );
\tmp_area[11]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(8),
      I3 => \o_area_reg_n_0_[9]\,
      I4 => \out\(9),
      I5 => state176_out,
      O => \p_1_in__0\(8)
    );
\tmp_area[11]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(7),
      I3 => \o_area_reg_n_0_[8]\,
      I4 => \out\(8),
      I5 => state176_out,
      O => \p_1_in__0\(7)
    );
\tmp_area[11]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(6),
      I3 => \o_area_reg_n_0_[7]\,
      I4 => \out\(7),
      I5 => state176_out,
      O => \p_1_in__0\(6)
    );
\tmp_area[15]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(12),
      I3 => \o_area_reg_n_0_[13]\,
      I4 => \out\(13),
      I5 => state176_out,
      O => \p_1_in__0\(12)
    );
\tmp_area[15]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(11),
      I3 => \o_area_reg_n_0_[12]\,
      I4 => \out\(12),
      I5 => state176_out,
      O => \p_1_in__0\(11)
    );
\tmp_area[15]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(10),
      I3 => \o_area_reg_n_0_[11]\,
      I4 => \out\(11),
      I5 => state176_out,
      O => \p_1_in__0\(10)
    );
\tmp_area[15]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(13),
      I3 => \o_area_reg_n_0_[14]\,
      I4 => \out\(14),
      I5 => state176_out,
      O => \p_1_in__0\(13)
    );
\tmp_area[15]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000200020002FFFF"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => state176_out,
      I3 => \o_area_reg_n_0_[15]\,
      I4 => \o_area_reg[15]_0\(14),
      I5 => \state_reg[0]_0\,
      O => \tmp_area_reg[15]_0\
    );
\tmp_area[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(0),
      I3 => \o_area_reg_n_0_[1]\,
      I4 => \out\(1),
      I5 => state176_out,
      O => \p_1_in__0\(0)
    );
\tmp_area[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(1),
      I3 => \o_area_reg_n_0_[2]\,
      I4 => \out\(2),
      I5 => state176_out,
      O => \p_1_in__0\(1)
    );
\tmp_area[4]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(7),
      I1 => tmp_area_reg(7),
      O => \tmp_area[4]_i_2__1_n_0\
    );
\tmp_area[4]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(6),
      I1 => tmp_area_reg(6),
      O => \tmp_area[4]_i_3__1_n_0\
    );
\tmp_area[4]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(5),
      I1 => tmp_area_reg(5),
      O => \tmp_area[4]_i_4__1_n_0\
    );
\tmp_area[4]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(4),
      I1 => tmp_area_reg(4),
      O => \tmp_area[4]_i_5__1_n_0\
    );
\tmp_area[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(5),
      I3 => \o_area_reg_n_0_[6]\,
      I4 => \out\(6),
      I5 => state176_out,
      O => \p_1_in__0\(5)
    );
\tmp_area[7]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(4),
      I3 => \o_area_reg_n_0_[5]\,
      I4 => \out\(5),
      I5 => state176_out,
      O => \p_1_in__0\(4)
    );
\tmp_area[7]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(3),
      I3 => \o_area_reg_n_0_[4]\,
      I4 => \out\(4),
      I5 => state176_out,
      O => \p_1_in__0\(3)
    );
\tmp_area[7]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF01230123"
    )
        port map (
      I0 => \^state172_out\,
      I1 => state174_out,
      I2 => \o_area_reg[15]_0\(2),
      I3 => \o_area_reg_n_0_[3]\,
      I4 => \out\(3),
      I5 => state176_out,
      O => \p_1_in__0\(2)
    );
\tmp_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2_n_7\,
      Q => tmp_area_reg(0),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_area_reg[0]_i_2_n_0\,
      CO(2) => \tmp_area_reg[0]_i_2_n_1\,
      CO(1) => \tmp_area_reg[0]_i_2_n_2\,
      CO(0) => \tmp_area_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => real_height(3 downto 0),
      O(3) => \tmp_area_reg[0]_i_2_n_4\,
      O(2) => \tmp_area_reg[0]_i_2_n_5\,
      O(1) => \tmp_area_reg[0]_i_2_n_6\,
      O(0) => \tmp_area_reg[0]_i_2_n_7\,
      S(3) => \tmp_area[0]_i_3_n_0\,
      S(2) => \tmp_area[0]_i_4__1_n_0\,
      S(1) => \tmp_area[0]_i_5__1_n_0\,
      S(0) => \tmp_area[0]_i_6__0_n_0\
    );
\tmp_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__1_n_5\,
      Q => tmp_area_reg(10),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__1_n_4\,
      Q => tmp_area_reg(11),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__1_n_7\,
      Q => tmp_area_reg(12),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[8]_i_1__1_n_0\,
      CO(3) => \NLW_tmp_area_reg[12]_i_1__1_CO_UNCONNECTED\(3),
      CO(2) => \tmp_area_reg[12]_i_1__1_n_1\,
      CO(1) => \tmp_area_reg[12]_i_1__1_n_2\,
      CO(0) => \tmp_area_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[12]_i_1__1_n_4\,
      O(2) => \tmp_area_reg[12]_i_1__1_n_5\,
      O(1) => \tmp_area_reg[12]_i_1__1_n_6\,
      O(0) => \tmp_area_reg[12]_i_1__1_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\tmp_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__1_n_6\,
      Q => tmp_area_reg(13),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__1_n_5\,
      Q => tmp_area_reg(14),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__1_n_4\,
      Q => tmp_area_reg(15),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2_n_6\,
      Q => tmp_area_reg(1),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2_n_5\,
      Q => tmp_area_reg(2),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2_n_4\,
      Q => tmp_area_reg(3),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__1_n_7\,
      Q => tmp_area_reg(4),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[0]_i_2_n_0\,
      CO(3) => \tmp_area_reg[4]_i_1__1_n_0\,
      CO(2) => \tmp_area_reg[4]_i_1__1_n_1\,
      CO(1) => \tmp_area_reg[4]_i_1__1_n_2\,
      CO(0) => \tmp_area_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => real_height(7 downto 4),
      O(3) => \tmp_area_reg[4]_i_1__1_n_4\,
      O(2) => \tmp_area_reg[4]_i_1__1_n_5\,
      O(1) => \tmp_area_reg[4]_i_1__1_n_6\,
      O(0) => \tmp_area_reg[4]_i_1__1_n_7\,
      S(3) => \tmp_area[4]_i_2__1_n_0\,
      S(2) => \tmp_area[4]_i_3__1_n_0\,
      S(1) => \tmp_area[4]_i_4__1_n_0\,
      S(0) => \tmp_area[4]_i_5__1_n_0\
    );
\tmp_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__1_n_6\,
      Q => tmp_area_reg(5),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__1_n_5\,
      Q => tmp_area_reg(6),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__1_n_4\,
      Q => tmp_area_reg(7),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__1_n_7\,
      Q => tmp_area_reg(8),
      R => \real_height[7]_i_1_n_0\
    );
\tmp_area_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[4]_i_1__1_n_0\,
      CO(3) => \tmp_area_reg[8]_i_1__1_n_0\,
      CO(2) => \tmp_area_reg[8]_i_1__1_n_1\,
      CO(1) => \tmp_area_reg[8]_i_1__1_n_2\,
      CO(0) => \tmp_area_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[8]_i_1__1_n_4\,
      O(2) => \tmp_area_reg[8]_i_1__1_n_5\,
      O(1) => \tmp_area_reg[8]_i_1__1_n_6\,
      O(0) => \tmp_area_reg[8]_i_1__1_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\tmp_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__1_n_6\,
      Q => tmp_area_reg(9),
      R => \real_height[7]_i_1_n_0\
    );
\y[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \y_reg__0\(0),
      O => \plusOp__3\(0)
    );
\y[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      O => \plusOp__3\(1)
    );
\y[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(2),
      O => \plusOp__3\(2)
    );
\y[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(3),
      O => \plusOp__3\(3)
    );
\y[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(3),
      I4 => \y_reg__0\(4),
      O => \plusOp__3\(4)
    );
\y[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \y_reg__0\(3),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(2),
      I4 => \y_reg__0\(4),
      I5 => \y_reg__0\(5),
      O => \plusOp__3\(5)
    );
\y[6]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y[7]_i_4_n_0\,
      I1 => \y_reg__0\(6),
      O => \plusOp__3\(6)
    );
\y[7]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tmp_address[15]_i_3__0_n_0\,
      I1 => i_rst_IBUF,
      O => zero
    );
\y[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => CO(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => y
    );
\y[7]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y[7]_i_4_n_0\,
      I1 => \y_reg__0\(6),
      I2 => \y_reg__0\(7),
      O => \plusOp__3\(7)
    );
\y[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(2),
      I5 => \y_reg__0\(4),
      O => \y[7]_i_4_n_0\
    );
\y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(0),
      Q => \y_reg__0\(0),
      R => zero
    );
\y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(1),
      Q => \y_reg__0\(1),
      R => zero
    );
\y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(2),
      Q => \y_reg__0\(2),
      R => zero
    );
\y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(3),
      Q => \y_reg__0\(3),
      R => zero
    );
\y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(4),
      Q => \y_reg__0\(4),
      R => zero
    );
\y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(5),
      Q => \y_reg__0\(5),
      R => zero
    );
\y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(6),
      Q => \y_reg__0\(6),
      R => zero
    );
\y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__3\(7),
      Q => \y_reg__0\(7),
      R => zero
    );
zero0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero0_carry_n_0,
      CO(2) => zero0_carry_n_1,
      CO(1) => zero0_carry_n_2,
      CO(0) => zero0_carry_n_3,
      CYINIT => \out\(0),
      DI(3 downto 2) => B"00",
      DI(1) => \out\(2),
      DI(0) => '0',
      O(3 downto 0) => data(4 downto 1),
      S(3 downto 2) => \out\(4 downto 3),
      S(1) => S(0),
      S(0) => \out\(1)
    );
\zero0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => zero0_carry_n_0,
      CO(3) => \zero0_carry__0_n_0\,
      CO(2) => \zero0_carry__0_n_1\,
      CO(1) => \zero0_carry__0_n_2\,
      CO(0) => \zero0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data(8 downto 5),
      S(3 downto 0) => \out\(8 downto 5)
    );
\zero0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero0_carry__0_n_0\,
      CO(3) => \zero0_carry__1_n_0\,
      CO(2) => \zero0_carry__1_n_1\,
      CO(1) => \zero0_carry__1_n_2\,
      CO(0) => \zero0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data(12 downto 9),
      S(3 downto 0) => \out\(12 downto 9)
    );
\zero0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero0_carry__1_n_0\,
      CO(3 downto 2) => \NLW_zero0_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \zero0_carry__2_n_2\,
      CO(0) => \zero0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_zero0_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => data(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => \out\(15 downto 13)
    );
\zero[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDFF0100"
    )
        port map (
      I0 => \out\(0),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(0),
      O => \zero[0]_i_2_n_0\
    );
\zero[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(3),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(3),
      O => \zero[0]_i_3_n_0\
    );
\zero[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(2),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(2),
      O => \zero[0]_i_4_n_0\
    );
\zero[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(1),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(1),
      O => \zero[0]_i_5_n_0\
    );
\zero[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555535"
    )
        port map (
      I0 => zero_reg(0),
      I1 => \out\(0),
      I2 => start_lft,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[0]_i_6_n_0\
    );
\zero[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(15),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(15),
      O => \zero[12]_i_2_n_0\
    );
\zero[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(14),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(14),
      O => \zero[12]_i_3_n_0\
    );
\zero[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(13),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(13),
      O => \zero[12]_i_4_n_0\
    );
\zero[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(12),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(12),
      O => \zero[12]_i_5_n_0\
    );
\zero[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(7),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(7),
      O => \zero[4]_i_2_n_0\
    );
\zero[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(6),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(6),
      O => \zero[4]_i_3_n_0\
    );
\zero[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(5),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(5),
      O => \zero[4]_i_4_n_0\
    );
\zero[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(4),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(4),
      O => \zero[4]_i_5_n_0\
    );
\zero[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(11),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(11),
      O => \zero[8]_i_2_n_0\
    );
\zero[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(10),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(10),
      O => \zero[8]_i_3_n_0\
    );
\zero[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(9),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(9),
      O => \zero[8]_i_4_n_0\
    );
\zero[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data(8),
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_lft,
      I4 => zero_reg(8),
      O => \zero[8]_i_5_n_0\
    );
\zero_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1_n_7\,
      Q => zero_reg(0),
      R => '0'
    );
\zero_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \zero_reg[0]_i_1_n_0\,
      CO(2) => \zero_reg[0]_i_1_n_1\,
      CO(1) => \zero_reg[0]_i_1_n_2\,
      CO(0) => \zero_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \zero[0]_i_2_n_0\,
      O(3) => \zero_reg[0]_i_1_n_4\,
      O(2) => \zero_reg[0]_i_1_n_5\,
      O(1) => \zero_reg[0]_i_1_n_6\,
      O(0) => \zero_reg[0]_i_1_n_7\,
      S(3) => \zero[0]_i_3_n_0\,
      S(2) => \zero[0]_i_4_n_0\,
      S(1) => \zero[0]_i_5_n_0\,
      S(0) => \zero[0]_i_6_n_0\
    );
\zero_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1_n_5\,
      Q => zero_reg(10),
      R => '0'
    );
\zero_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1_n_4\,
      Q => zero_reg(11),
      R => '0'
    );
\zero_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1_n_7\,
      Q => zero_reg(12),
      R => '0'
    );
\zero_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[8]_i_1_n_0\,
      CO(3) => \NLW_zero_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \zero_reg[12]_i_1_n_1\,
      CO(1) => \zero_reg[12]_i_1_n_2\,
      CO(0) => \zero_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_reg[12]_i_1_n_4\,
      O(2) => \zero_reg[12]_i_1_n_5\,
      O(1) => \zero_reg[12]_i_1_n_6\,
      O(0) => \zero_reg[12]_i_1_n_7\,
      S(3) => \zero[12]_i_2_n_0\,
      S(2) => \zero[12]_i_3_n_0\,
      S(1) => \zero[12]_i_4_n_0\,
      S(0) => \zero[12]_i_5_n_0\
    );
\zero_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1_n_6\,
      Q => zero_reg(13),
      R => '0'
    );
\zero_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1_n_5\,
      Q => zero_reg(14),
      R => '0'
    );
\zero_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1_n_4\,
      Q => zero_reg(15),
      R => '0'
    );
\zero_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1_n_6\,
      Q => zero_reg(1),
      R => '0'
    );
\zero_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1_n_5\,
      Q => zero_reg(2),
      R => '0'
    );
\zero_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1_n_4\,
      Q => zero_reg(3),
      R => '0'
    );
\zero_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1_n_7\,
      Q => zero_reg(4),
      R => '0'
    );
\zero_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[0]_i_1_n_0\,
      CO(3) => \zero_reg[4]_i_1_n_0\,
      CO(2) => \zero_reg[4]_i_1_n_1\,
      CO(1) => \zero_reg[4]_i_1_n_2\,
      CO(0) => \zero_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_reg[4]_i_1_n_4\,
      O(2) => \zero_reg[4]_i_1_n_5\,
      O(1) => \zero_reg[4]_i_1_n_6\,
      O(0) => \zero_reg[4]_i_1_n_7\,
      S(3) => \zero[4]_i_2_n_0\,
      S(2) => \zero[4]_i_3_n_0\,
      S(1) => \zero[4]_i_4_n_0\,
      S(0) => \zero[4]_i_5_n_0\
    );
\zero_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1_n_6\,
      Q => zero_reg(5),
      R => '0'
    );
\zero_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1_n_5\,
      Q => zero_reg(6),
      R => '0'
    );
\zero_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1_n_4\,
      Q => zero_reg(7),
      R => '0'
    );
\zero_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1_n_7\,
      Q => zero_reg(8),
      R => '0'
    );
\zero_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[4]_i_1_n_0\,
      CO(3) => \zero_reg[8]_i_1_n_0\,
      CO(2) => \zero_reg[8]_i_1_n_1\,
      CO(1) => \zero_reg[8]_i_1_n_2\,
      CO(0) => \zero_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_reg[8]_i_1_n_4\,
      O(2) => \zero_reg[8]_i_1_n_5\,
      O(1) => \zero_reg[8]_i_1_n_6\,
      O(0) => \zero_reg[8]_i_1_n_7\,
      S(3) => \zero[8]_i_2_n_0\,
      S(2) => \zero[8]_i_3_n_0\,
      S(1) => \zero[8]_i_4_n_0\,
      S(0) => \zero[8]_i_5_n_0\
    );
\zero_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1_n_6\,
      Q => zero_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comp_rgt is
  port (
    \o_address_reg[3]\ : out STD_LOGIC;
    \o_address_reg[3]_0\ : out STD_LOGIC;
    \state_reg[3]\ : out STD_LOGIC;
    \state_reg[3]_0\ : out STD_LOGIC;
    \state_reg[1]_0\ : out STD_LOGIC;
    \o_address_reg[0]\ : out STD_LOGIC;
    \o_address_reg[2]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \o_address_reg[1]\ : out STD_LOGIC;
    \o_address_reg[2]_0\ : out STD_LOGIC;
    \o_address_reg[3]_1\ : out STD_LOGIC;
    \o_address_reg[4]\ : out STD_LOGIC;
    \o_address_reg[5]\ : out STD_LOGIC;
    \o_address_reg[6]\ : out STD_LOGIC;
    \o_address_reg[7]\ : out STD_LOGIC;
    \o_address_reg[8]\ : out STD_LOGIC;
    \o_address_reg[9]\ : out STD_LOGIC;
    \o_address_reg[10]\ : out STD_LOGIC;
    \o_address_reg[11]\ : out STD_LOGIC;
    \o_address_reg[12]\ : out STD_LOGIC;
    \o_address_reg[13]\ : out STD_LOGIC;
    \o_address_reg[14]\ : out STD_LOGIC;
    \o_address_reg[15]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    state1 : out STD_LOGIC;
    \tmp_area_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    i_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \out\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \tmp_area_reg[6]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \tmp_area_reg[7]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    i_rst_IBUF : in STD_LOGIC;
    i_clk_IBUF_BUFG : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \state_reg[0]_0\ : in STD_LOGIC;
    \state_reg[1]_1\ : in STD_LOGIC;
    \state_reg[0]_1\ : in STD_LOGIC;
    p_1_in : in STD_LOGIC;
    \state_reg[1]_2\ : in STD_LOGIC;
    \p_1_in__1\ : in STD_LOGIC;
    multiplied_reg : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_rgt : in STD_LOGIC;
    \state_reg[2]\ : in STD_LOGIC;
    \tmp_address_reg[0]_0\ : in STD_LOGIC;
    \tmp_address_reg[1]_0\ : in STD_LOGIC;
    \tmp_address_reg[2]_0\ : in STD_LOGIC;
    \state_reg[3]_1\ : in STD_LOGIC;
    \tmp_address_reg[3]_0\ : in STD_LOGIC;
    \tmp_address_reg[4]_0\ : in STD_LOGIC;
    \tmp_address_reg[5]_0\ : in STD_LOGIC;
    \tmp_address_reg[6]_0\ : in STD_LOGIC;
    \tmp_address_reg[7]_0\ : in STD_LOGIC;
    \tmp_address_reg[8]_0\ : in STD_LOGIC;
    \tmp_address_reg[9]_0\ : in STD_LOGIC;
    \tmp_address_reg[10]_0\ : in STD_LOGIC;
    \tmp_address_reg[11]_0\ : in STD_LOGIC;
    \tmp_address_reg[12]_0\ : in STD_LOGIC;
    \tmp_address_reg[13]_0\ : in STD_LOGIC;
    \tmp_address_reg[14]_0\ : in STD_LOGIC;
    \tmp_address_reg[15]_0\ : in STD_LOGIC;
    \state_reg[0]_2\ : in STD_LOGIC;
    state180_out : in STD_LOGIC;
    \state_reg[2]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end comp_rgt;

architecture STRUCTURE of comp_rgt is
  signal minusOp : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \minusOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_carry__2_n_3\ : STD_LOGIC;
  signal minusOp_carry_i_1_n_0 : STD_LOGIC;
  signal minusOp_carry_i_2_n_0 : STD_LOGIC;
  signal minusOp_carry_i_3_n_0 : STD_LOGIC;
  signal minusOp_carry_i_4_n_0 : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal \^o_address_reg[2]\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^o_address_reg[3]\ : STD_LOGIC;
  signal \o_area0__0\ : STD_LOGIC;
  signal o_area15_out : STD_LOGIC;
  signal \o_area[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \o_area[15]_i_6__0_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[3]_i_5_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_2_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_3_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_4_n_0\ : STD_LOGIC;
  signal \o_area[7]_i_5_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_1\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_2\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_3\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_4\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_5\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_6\ : STD_LOGIC;
  signal \o_area_reg[11]_i_1__1_n_7\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_1\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_2\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_3\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_4\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_5\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_6\ : STD_LOGIC;
  signal \o_area_reg[15]_i_2__1_n_7\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_1\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_2\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_3\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_4\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_5\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_6\ : STD_LOGIC;
  signal \o_area_reg[3]_i_1__1_n_7\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_1\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_2\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_3\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_4\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_5\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_6\ : STD_LOGIC;
  signal \o_area_reg[7]_i_1__1_n_7\ : STD_LOGIC;
  signal \o_end_i_1__1_n_0\ : STD_LOGIC;
  signal \plusOp__4\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal real_height : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \real_height[7]_i_1__0_n_0\ : STD_LOGIC;
  signal rgt_address : STD_LOGIC_VECTOR ( 15 downto 3 );
  signal \^state1\ : STD_LOGIC;
  signal \state[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1__3_n_0\ : STD_LOGIC;
  signal state_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^state_reg[3]_0\ : STD_LOGIC;
  signal tmp_address : STD_LOGIC;
  signal \tmp_address[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \tmp_address[10]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[13]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[14]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_2__1_n_0\ : STD_LOGIC;
  signal \tmp_address[15]_i_3__1_n_0\ : STD_LOGIC;
  signal \tmp_address[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[3]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[7]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[11]_i_2__0_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[15]_i_4__0_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[3]_i_2__0_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[7]_i_2__0_n_7\ : STD_LOGIC;
  signal tmp_area : STD_LOGIC;
  signal \tmp_area[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_6__1_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_2__2_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_4__2_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_5__2_n_0\ : STD_LOGIC;
  signal tmp_area_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tmp_area_reg[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_2__0_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal y : STD_LOGIC;
  signal \y[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \y_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zero : STD_LOGIC;
  signal \zero0_carry__0_n_0\ : STD_LOGIC;
  signal \zero0_carry__0_n_1\ : STD_LOGIC;
  signal \zero0_carry__0_n_2\ : STD_LOGIC;
  signal \zero0_carry__0_n_3\ : STD_LOGIC;
  signal \zero0_carry__0_n_4\ : STD_LOGIC;
  signal \zero0_carry__0_n_5\ : STD_LOGIC;
  signal \zero0_carry__0_n_6\ : STD_LOGIC;
  signal \zero0_carry__0_n_7\ : STD_LOGIC;
  signal \zero0_carry__1_n_0\ : STD_LOGIC;
  signal \zero0_carry__1_n_1\ : STD_LOGIC;
  signal \zero0_carry__1_n_2\ : STD_LOGIC;
  signal \zero0_carry__1_n_3\ : STD_LOGIC;
  signal \zero0_carry__1_n_4\ : STD_LOGIC;
  signal \zero0_carry__1_n_5\ : STD_LOGIC;
  signal \zero0_carry__1_n_6\ : STD_LOGIC;
  signal \zero0_carry__1_n_7\ : STD_LOGIC;
  signal \zero0_carry__2_n_1\ : STD_LOGIC;
  signal \zero0_carry__2_n_2\ : STD_LOGIC;
  signal \zero0_carry__2_n_3\ : STD_LOGIC;
  signal \zero0_carry__2_n_4\ : STD_LOGIC;
  signal \zero0_carry__2_n_5\ : STD_LOGIC;
  signal \zero0_carry__2_n_6\ : STD_LOGIC;
  signal \zero0_carry__2_n_7\ : STD_LOGIC;
  signal zero0_carry_n_0 : STD_LOGIC;
  signal zero0_carry_n_1 : STD_LOGIC;
  signal zero0_carry_n_2 : STD_LOGIC;
  signal zero0_carry_n_3 : STD_LOGIC;
  signal zero0_carry_n_4 : STD_LOGIC;
  signal zero0_carry_n_5 : STD_LOGIC;
  signal zero0_carry_n_6 : STD_LOGIC;
  signal zero0_carry_n_7 : STD_LOGIC;
  signal \zero[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \zero[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \zero[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \zero[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \zero[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \zero[0]_i_7_n_0\ : STD_LOGIC;
  signal \zero[0]_i_8_n_0\ : STD_LOGIC;
  signal \zero[0]_i_9_n_0\ : STD_LOGIC;
  signal \zero[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \zero[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \zero[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \zero[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \zero[12]_i_6_n_0\ : STD_LOGIC;
  signal \zero[12]_i_7_n_0\ : STD_LOGIC;
  signal \zero[12]_i_8_n_0\ : STD_LOGIC;
  signal \zero[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \zero[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \zero[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \zero[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \zero[4]_i_6_n_0\ : STD_LOGIC;
  signal \zero[4]_i_7_n_0\ : STD_LOGIC;
  signal \zero[4]_i_8_n_0\ : STD_LOGIC;
  signal \zero[4]_i_9_n_0\ : STD_LOGIC;
  signal \zero[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \zero[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \zero[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \zero[8]_i_5__0_n_0\ : STD_LOGIC;
  signal \zero[8]_i_6_n_0\ : STD_LOGIC;
  signal \zero[8]_i_7_n_0\ : STD_LOGIC;
  signal \zero[8]_i_8_n_0\ : STD_LOGIC;
  signal \zero[8]_i_9_n_0\ : STD_LOGIC;
  signal zero_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \zero_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \zero_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \zero_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \zero_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \zero_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \NLW_minusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_o_area_reg[15]_i_2__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_address_reg[15]_i_4__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_area_reg[12]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_zero_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_address[10]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \o_address[11]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \o_address[12]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \o_address[13]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \o_address[14]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \o_address[3]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \o_address[4]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \o_address[5]_i_1__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \o_address[6]_i_1__0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \o_address[7]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \o_address[8]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \o_address[9]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \o_area[15]_i_5__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \o_end_i_1__1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \state[1]_i_1__3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tmp_address[15]_i_3__1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \tmp_address[15]_i_5__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \y[0]_i_1__2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \y[1]_i_1__2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \y[2]_i_1__2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \y[3]_i_1__2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \y[4]_i_1__2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \y[6]_i_1__2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \y[7]_i_3__1\ : label is "soft_lutpair32";
begin
  \o_address_reg[2]\(2 downto 0) <= \^o_address_reg[2]\(2 downto 0);
  \o_address_reg[3]\ <= \^o_address_reg[3]\;
  state1 <= \^state1\;
  \state_reg[3]_0\ <= \^state_reg[3]_0\;
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => zero_reg(0),
      DI(3 downto 0) => zero_reg(4 downto 1),
      O(3 downto 0) => minusOp(4 downto 1),
      S(3) => minusOp_carry_i_1_n_0,
      S(2) => minusOp_carry_i_2_n_0,
      S(1) => minusOp_carry_i_3_n_0,
      S(0) => minusOp_carry_i_4_n_0
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \minusOp_carry__0_n_0\,
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => zero_reg(8 downto 5),
      O(3 downto 0) => minusOp(8 downto 5),
      S(3) => \minusOp_carry__0_i_1_n_0\,
      S(2) => \minusOp_carry__0_i_2_n_0\,
      S(1) => \minusOp_carry__0_i_3_n_0\,
      S(0) => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(8),
      O => \minusOp_carry__0_i_1_n_0\
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(7),
      O => \minusOp_carry__0_i_2_n_0\
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(6),
      O => \minusOp_carry__0_i_3_n_0\
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(5),
      O => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__0_n_0\,
      CO(3) => \minusOp_carry__1_n_0\,
      CO(2) => \minusOp_carry__1_n_1\,
      CO(1) => \minusOp_carry__1_n_2\,
      CO(0) => \minusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => zero_reg(12 downto 9),
      O(3 downto 0) => minusOp(12 downto 9),
      S(3) => \minusOp_carry__1_i_1_n_0\,
      S(2) => \minusOp_carry__1_i_2_n_0\,
      S(1) => \minusOp_carry__1_i_3_n_0\,
      S(0) => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(12),
      O => \minusOp_carry__1_i_1_n_0\
    );
\minusOp_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(11),
      O => \minusOp_carry__1_i_2_n_0\
    );
\minusOp_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(10),
      O => \minusOp_carry__1_i_3_n_0\
    );
\minusOp_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(9),
      O => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__1_n_0\,
      CO(3 downto 2) => \NLW_minusOp_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_carry__2_n_2\,
      CO(0) => \minusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => zero_reg(14 downto 13),
      O(3) => \NLW_minusOp_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => minusOp(15 downto 13),
      S(3) => '0',
      S(2) => \minusOp_carry__2_i_1_n_0\,
      S(1) => \minusOp_carry__2_i_2_n_0\,
      S(0) => \minusOp_carry__2_i_3_n_0\
    );
\minusOp_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(15),
      O => \minusOp_carry__2_i_1_n_0\
    );
\minusOp_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(14),
      O => \minusOp_carry__2_i_2_n_0\
    );
\minusOp_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(13),
      O => \minusOp_carry__2_i_3_n_0\
    );
minusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(4),
      O => minusOp_carry_i_1_n_0
    );
minusOp_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(3),
      O => minusOp_carry_i_2_n_0
    );
minusOp_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(2),
      O => minusOp_carry_i_3_n_0
    );
minusOp_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_reg(1),
      O => minusOp_carry_i_4_n_0
    );
\o_address[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0A0A5F5F0A4E"
    )
        port map (
      I0 => \state_reg[2]\,
      I1 => \^o_address_reg[2]\(0),
      I2 => \tmp_address_reg[0]_0\,
      I3 => \^o_address_reg[3]\,
      I4 => state(1),
      I5 => state(0),
      O => \o_address_reg[0]\
    );
\o_address[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(10),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[10]_0\,
      O => \o_address_reg[10]\
    );
\o_address[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(11),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[11]_0\,
      O => \o_address_reg[11]\
    );
\o_address[12]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(12),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[12]_0\,
      O => \o_address_reg[12]\
    );
\o_address[13]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(13),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[13]_0\,
      O => \o_address_reg[13]\
    );
\o_address[14]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(14),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[14]_0\,
      O => \o_address_reg[14]\
    );
\o_address[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222022000000000"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      I4 => \^o_address_reg[3]\,
      I5 => \state_reg[0]_0\,
      O => \o_address_reg[3]_0\
    );
\o_address[15]_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(15),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[15]_0\,
      O => \o_address_reg[15]\
    );
\o_address[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001F8F90000F8F8"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \state_reg[2]\,
      I3 => \^o_address_reg[3]\,
      I4 => \tmp_address_reg[1]_0\,
      I5 => \^o_address_reg[2]\(1),
      O => \o_address_reg[1]\
    );
\o_address[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001F8F90000F8F8"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \state_reg[2]\,
      I3 => \^o_address_reg[3]\,
      I4 => \tmp_address_reg[2]_0\,
      I5 => \^o_address_reg[2]\(2),
      O => \o_address_reg[2]_0\
    );
\o_address[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(3),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[3]_0\,
      O => \o_address_reg[3]_1\
    );
\o_address[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(4),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[4]_0\,
      O => \o_address_reg[4]\
    );
\o_address[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(5),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[5]_0\,
      O => \o_address_reg[5]\
    );
\o_address[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(6),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[6]_0\,
      O => \o_address_reg[6]\
    );
\o_address[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(7),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[7]_0\,
      O => \o_address_reg[7]\
    );
\o_address[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(8),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[8]_0\,
      O => \o_address_reg[8]\
    );
\o_address[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rgt_address(9),
      I1 => \state_reg[3]_1\,
      I2 => \tmp_address_reg[9]_0\,
      O => \o_address_reg[9]\
    );
\o_area[15]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA2"
    )
        port map (
      I0 => \o_area0__0\,
      I1 => start_rgt,
      I2 => state_0(0),
      I3 => state_0(1),
      O => \o_area[15]_i_1__1_n_0\
    );
\o_area[15]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => \o_area[15]_i_4__0_n_0\,
      I1 => \y_reg__0\(5),
      I2 => real_height(5),
      I3 => \y_reg__0\(2),
      I4 => real_height(2),
      I5 => \o_area[15]_i_5__0_n_0\,
      O => \o_area0__0\
    );
\o_area[15]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4004000000004004"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => real_height(6),
      I3 => \y_reg__0\(6),
      I4 => real_height(7),
      I5 => \y_reg__0\(7),
      O => \o_area[15]_i_4__0_n_0\
    );
\o_area[15]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => real_height(0),
      I1 => \y_reg__0\(0),
      I2 => real_height(1),
      I3 => \y_reg__0\(1),
      I4 => \o_area[15]_i_6__0_n_0\,
      O => \o_area[15]_i_5__0_n_0\
    );
\o_area[15]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \y_reg__0\(4),
      I1 => real_height(4),
      I2 => \y_reg__0\(3),
      I3 => real_height(3),
      O => \o_area[15]_i_6__0_n_0\
    );
\o_area[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(3),
      I1 => real_height(3),
      O => \o_area[3]_i_2_n_0\
    );
\o_area[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(2),
      I1 => real_height(2),
      O => \o_area[3]_i_3_n_0\
    );
\o_area[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(1),
      I1 => real_height(1),
      O => \o_area[3]_i_4_n_0\
    );
\o_area[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(0),
      I1 => real_height(0),
      O => \o_area[3]_i_5_n_0\
    );
\o_area[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(7),
      I1 => real_height(7),
      O => \o_area[7]_i_2_n_0\
    );
\o_area[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(6),
      I1 => real_height(6),
      O => \o_area[7]_i_3_n_0\
    );
\o_area[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(5),
      I1 => real_height(5),
      O => \o_area[7]_i_4_n_0\
    );
\o_area[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tmp_area_reg(4),
      I1 => real_height(4),
      O => \o_area[7]_i_5_n_0\
    );
\o_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[3]_i_1__1_n_7\,
      Q => \tmp_area_reg[15]_0\(0),
      R => i_rst_IBUF
    );
\o_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[11]_i_1__1_n_5\,
      Q => \tmp_area_reg[15]_0\(10),
      R => i_rst_IBUF
    );
\o_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[11]_i_1__1_n_4\,
      Q => \tmp_area_reg[15]_0\(11),
      R => i_rst_IBUF
    );
\o_area_reg[11]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[7]_i_1__1_n_0\,
      CO(3) => \o_area_reg[11]_i_1__1_n_0\,
      CO(2) => \o_area_reg[11]_i_1__1_n_1\,
      CO(1) => \o_area_reg[11]_i_1__1_n_2\,
      CO(0) => \o_area_reg[11]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[11]_i_1__1_n_4\,
      O(2) => \o_area_reg[11]_i_1__1_n_5\,
      O(1) => \o_area_reg[11]_i_1__1_n_6\,
      O(0) => \o_area_reg[11]_i_1__1_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\o_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[15]_i_2__1_n_7\,
      Q => \tmp_area_reg[15]_0\(12),
      R => i_rst_IBUF
    );
\o_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[15]_i_2__1_n_6\,
      Q => \tmp_area_reg[15]_0\(13),
      R => i_rst_IBUF
    );
\o_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[15]_i_2__1_n_5\,
      Q => \tmp_area_reg[15]_0\(14),
      R => i_rst_IBUF
    );
\o_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[15]_i_2__1_n_4\,
      Q => \tmp_area_reg[15]_0\(15),
      R => i_rst_IBUF
    );
\o_area_reg[15]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[11]_i_1__1_n_0\,
      CO(3) => \NLW_o_area_reg[15]_i_2__1_CO_UNCONNECTED\(3),
      CO(2) => \o_area_reg[15]_i_2__1_n_1\,
      CO(1) => \o_area_reg[15]_i_2__1_n_2\,
      CO(0) => \o_area_reg[15]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_area_reg[15]_i_2__1_n_4\,
      O(2) => \o_area_reg[15]_i_2__1_n_5\,
      O(1) => \o_area_reg[15]_i_2__1_n_6\,
      O(0) => \o_area_reg[15]_i_2__1_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\o_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[3]_i_1__1_n_6\,
      Q => \tmp_area_reg[15]_0\(1),
      R => i_rst_IBUF
    );
\o_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[3]_i_1__1_n_5\,
      Q => \tmp_area_reg[15]_0\(2),
      R => i_rst_IBUF
    );
\o_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[3]_i_1__1_n_4\,
      Q => \tmp_area_reg[15]_0\(3),
      R => i_rst_IBUF
    );
\o_area_reg[3]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \o_area_reg[3]_i_1__1_n_0\,
      CO(2) => \o_area_reg[3]_i_1__1_n_1\,
      CO(1) => \o_area_reg[3]_i_1__1_n_2\,
      CO(0) => \o_area_reg[3]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(3 downto 0),
      O(3) => \o_area_reg[3]_i_1__1_n_4\,
      O(2) => \o_area_reg[3]_i_1__1_n_5\,
      O(1) => \o_area_reg[3]_i_1__1_n_6\,
      O(0) => \o_area_reg[3]_i_1__1_n_7\,
      S(3) => \o_area[3]_i_2_n_0\,
      S(2) => \o_area[3]_i_3_n_0\,
      S(1) => \o_area[3]_i_4_n_0\,
      S(0) => \o_area[3]_i_5_n_0\
    );
\o_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[7]_i_1__1_n_7\,
      Q => \tmp_area_reg[15]_0\(4),
      R => i_rst_IBUF
    );
\o_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[7]_i_1__1_n_6\,
      Q => \tmp_area_reg[15]_0\(5),
      R => i_rst_IBUF
    );
\o_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[7]_i_1__1_n_5\,
      Q => \tmp_area_reg[15]_0\(6),
      R => i_rst_IBUF
    );
\o_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[7]_i_1__1_n_4\,
      Q => \tmp_area_reg[15]_0\(7),
      R => i_rst_IBUF
    );
\o_area_reg[7]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_area_reg[3]_i_1__1_n_0\,
      CO(3) => \o_area_reg[7]_i_1__1_n_0\,
      CO(2) => \o_area_reg[7]_i_1__1_n_1\,
      CO(1) => \o_area_reg[7]_i_1__1_n_2\,
      CO(0) => \o_area_reg[7]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_area_reg(7 downto 4),
      O(3) => \o_area_reg[7]_i_1__1_n_4\,
      O(2) => \o_area_reg[7]_i_1__1_n_5\,
      O(1) => \o_area_reg[7]_i_1__1_n_6\,
      O(0) => \o_area_reg[7]_i_1__1_n_7\,
      S(3) => \o_area[7]_i_2_n_0\,
      S(2) => \o_area[7]_i_3_n_0\,
      S(1) => \o_area[7]_i_4_n_0\,
      S(0) => \o_area[7]_i_5_n_0\
    );
\o_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[11]_i_1__1_n_7\,
      Q => \tmp_area_reg[15]_0\(8),
      R => i_rst_IBUF
    );
\o_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_area[15]_i_1__1_n_0\,
      D => \o_area_reg[11]_i_1__1_n_6\,
      Q => \tmp_area_reg[15]_0\(9),
      R => i_rst_IBUF
    );
\o_data[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000200"
    )
        port map (
      I0 => \state_reg[1]_2\,
      I1 => \state_reg[1]_1\,
      I2 => p_1_in,
      I3 => \state_reg[2]_0\,
      I4 => \^state1\,
      I5 => \state_reg[0]_2\,
      O => E(0)
    );
o_done_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => \^o_address_reg[3]\,
      I3 => state(0),
      I4 => state(1),
      O => \^state1\
    );
\o_end_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0010"
    )
        port map (
      I0 => \tmp_address[15]_i_3__1_n_0\,
      I1 => CO(0),
      I2 => state_0(0),
      I3 => state_0(1),
      I4 => \^o_address_reg[3]\,
      O => \o_end_i_1__1_n_0\
    );
o_end_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \o_end_i_1__1_n_0\,
      Q => \^o_address_reg[3]\,
      R => i_rst_IBUF
    );
\real_height[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => start_rgt,
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => \real_height[7]_i_1__0_n_0\
    );
\real_height_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(0),
      Q => real_height(0),
      R => '0'
    );
\real_height_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(1),
      Q => real_height(1),
      R => '0'
    );
\real_height_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(2),
      Q => real_height(2),
      R => '0'
    );
\real_height_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(3),
      Q => real_height(3),
      R => '0'
    );
\real_height_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(4),
      Q => real_height(4),
      R => '0'
    );
\real_height_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(5),
      Q => real_height(5),
      R => '0'
    );
\real_height_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(6),
      Q => real_height(6),
      R => '0'
    );
\real_height_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \real_height[7]_i_1__0_n_0\,
      D => D(7),
      Q => real_height(7),
      R => '0'
    );
\state[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => \tmp_address[15]_i_3__1_n_0\,
      O => \state[0]_i_1__1_n_0\
    );
\state[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000003F3B333B"
    )
        port map (
      I0 => state(1),
      I1 => \state_reg[1]_2\,
      I2 => \p_1_in__1\,
      I3 => \^state_reg[3]_0\,
      I4 => multiplied_reg,
      I5 => \state_reg[1]_1\,
      O => \state_reg[1]_0\
    );
\state[1]_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFC4"
    )
        port map (
      I0 => CO(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => \tmp_address[15]_i_3__1_n_0\,
      O => \state[1]_i_1__3_n_0\
    );
\state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000540400000000"
    )
        port map (
      I0 => \state_reg[1]_1\,
      I1 => state(3),
      I2 => \^state_reg[3]_0\,
      I3 => \state_reg[0]_1\,
      I4 => p_1_in,
      I5 => \state_reg[1]_2\,
      O => \state_reg[3]\
    );
\state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF00FE"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => \^o_address_reg[3]\,
      I3 => \state_reg[2]\,
      I4 => \state_reg[0]_2\,
      I5 => state180_out,
      O => \^state_reg[3]_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[0]_i_1__1_n_0\,
      Q => state_0(0),
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[1]_i_1__3_n_0\,
      Q => state_0(1),
      R => i_rst_IBUF
    );
\tmp_address[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF22F222F222F2"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2__0_n_7\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => zero_reg(0),
      I4 => o_area15_out,
      I5 => zero0_carry_n_7,
      O => \tmp_address[0]_i_1__2_n_0\
    );
\tmp_address[10]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2__0_n_5\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(10),
      I4 => o_area15_out,
      I5 => \zero0_carry__1_n_5\,
      O => \tmp_address[10]_i_1__1_n_0\
    );
\tmp_address[11]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2__0_n_4\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(11),
      I4 => o_area15_out,
      I5 => \zero0_carry__1_n_4\,
      O => \tmp_address[11]_i_1__1_n_0\
    );
\tmp_address[12]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4__0_n_7\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(12),
      I4 => o_area15_out,
      I5 => \zero0_carry__2_n_7\,
      O => \tmp_address[12]_i_1__1_n_0\
    );
\tmp_address[13]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4__0_n_6\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(13),
      I4 => o_area15_out,
      I5 => \zero0_carry__2_n_6\,
      O => \tmp_address[13]_i_1__1_n_0\
    );
\tmp_address[14]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4__0_n_5\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(14),
      I4 => o_area15_out,
      I5 => \zero0_carry__2_n_5\,
      O => \tmp_address[14]_i_1__1_n_0\
    );
\tmp_address[15]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF40"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => CO(0),
      I3 => \tmp_address[15]_i_3__1_n_0\,
      I4 => i_rst_IBUF,
      O => tmp_address
    );
\tmp_address[15]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[15]_i_4__0_n_4\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(15),
      I4 => o_area15_out,
      I5 => \zero0_carry__2_n_4\,
      O => \tmp_address[15]_i_2__1_n_0\
    );
\tmp_address[15]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
        port map (
      I0 => start_rgt,
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => \o_area0__0\,
      O => \tmp_address[15]_i_3__1_n_0\
    );
\tmp_address[15]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => start_rgt,
      O => o_area15_out
    );
\tmp_address[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2__0_n_6\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(1),
      I4 => o_area15_out,
      I5 => zero0_carry_n_6,
      O => \tmp_address[1]_i_1__1_n_0\
    );
\tmp_address[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2__0_n_5\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(2),
      I4 => o_area15_out,
      I5 => zero0_carry_n_5,
      O => \tmp_address[2]_i_1__1_n_0\
    );
\tmp_address[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[3]_i_2__0_n_4\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(3),
      I4 => o_area15_out,
      I5 => zero0_carry_n_4,
      O => \tmp_address[3]_i_1__1_n_0\
    );
\tmp_address[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rgt_address(3),
      I1 => Q(3),
      O => \tmp_address[3]_i_3_n_0\
    );
\tmp_address[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^o_address_reg[2]\(2),
      I1 => Q(2),
      O => \tmp_address[3]_i_4_n_0\
    );
\tmp_address[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^o_address_reg[2]\(1),
      I1 => Q(1),
      O => \tmp_address[3]_i_5_n_0\
    );
\tmp_address[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^o_address_reg[2]\(0),
      I1 => Q(0),
      O => \tmp_address[3]_i_6_n_0\
    );
\tmp_address[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2__0_n_7\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(4),
      I4 => o_area15_out,
      I5 => \zero0_carry__0_n_7\,
      O => \tmp_address[4]_i_1__1_n_0\
    );
\tmp_address[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2__0_n_6\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(5),
      I4 => o_area15_out,
      I5 => \zero0_carry__0_n_6\,
      O => \tmp_address[5]_i_1__1_n_0\
    );
\tmp_address[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2__0_n_5\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(6),
      I4 => o_area15_out,
      I5 => \zero0_carry__0_n_5\,
      O => \tmp_address[6]_i_1__1_n_0\
    );
\tmp_address[7]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[7]_i_2__0_n_4\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(7),
      I4 => o_area15_out,
      I5 => \zero0_carry__0_n_4\,
      O => \tmp_address[7]_i_1__1_n_0\
    );
\tmp_address[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rgt_address(7),
      I1 => Q(7),
      O => \tmp_address[7]_i_3_n_0\
    );
\tmp_address[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rgt_address(6),
      I1 => Q(6),
      O => \tmp_address[7]_i_4_n_0\
    );
\tmp_address[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rgt_address(5),
      I1 => Q(5),
      O => \tmp_address[7]_i_5_n_0\
    );
\tmp_address[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rgt_address(4),
      I1 => Q(4),
      O => \tmp_address[7]_i_6_n_0\
    );
\tmp_address[8]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2__0_n_7\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(8),
      I4 => o_area15_out,
      I5 => \zero0_carry__1_n_7\,
      O => \tmp_address[8]_i_1__1_n_0\
    );
\tmp_address[9]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \tmp_address_reg[11]_i_2__0_n_6\,
      I1 => \tmp_address[15]_i_3__1_n_0\,
      I2 => \o_area[15]_i_1__1_n_0\,
      I3 => minusOp(9),
      I4 => o_area15_out,
      I5 => \zero0_carry__1_n_6\,
      O => \tmp_address[9]_i_1__1_n_0\
    );
\tmp_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[0]_i_1__2_n_0\,
      Q => \^o_address_reg[2]\(0),
      R => '0'
    );
\tmp_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[10]_i_1__1_n_0\,
      Q => rgt_address(10),
      R => '0'
    );
\tmp_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[11]_i_1__1_n_0\,
      Q => rgt_address(11),
      R => '0'
    );
\tmp_address_reg[11]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[7]_i_2__0_n_0\,
      CO(3) => \tmp_address_reg[11]_i_2__0_n_0\,
      CO(2) => \tmp_address_reg[11]_i_2__0_n_1\,
      CO(1) => \tmp_address_reg[11]_i_2__0_n_2\,
      CO(0) => \tmp_address_reg[11]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[11]_i_2__0_n_4\,
      O(2) => \tmp_address_reg[11]_i_2__0_n_5\,
      O(1) => \tmp_address_reg[11]_i_2__0_n_6\,
      O(0) => \tmp_address_reg[11]_i_2__0_n_7\,
      S(3 downto 0) => rgt_address(11 downto 8)
    );
\tmp_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[12]_i_1__1_n_0\,
      Q => rgt_address(12),
      R => '0'
    );
\tmp_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[13]_i_1__1_n_0\,
      Q => rgt_address(13),
      R => '0'
    );
\tmp_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[14]_i_1__1_n_0\,
      Q => rgt_address(14),
      R => '0'
    );
\tmp_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[15]_i_2__1_n_0\,
      Q => rgt_address(15),
      R => '0'
    );
\tmp_address_reg[15]_i_4__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[11]_i_2__0_n_0\,
      CO(3) => \NLW_tmp_address_reg[15]_i_4__0_CO_UNCONNECTED\(3),
      CO(2) => \tmp_address_reg[15]_i_4__0_n_1\,
      CO(1) => \tmp_address_reg[15]_i_4__0_n_2\,
      CO(0) => \tmp_address_reg[15]_i_4__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[15]_i_4__0_n_4\,
      O(2) => \tmp_address_reg[15]_i_4__0_n_5\,
      O(1) => \tmp_address_reg[15]_i_4__0_n_6\,
      O(0) => \tmp_address_reg[15]_i_4__0_n_7\,
      S(3 downto 0) => rgt_address(15 downto 12)
    );
\tmp_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[1]_i_1__1_n_0\,
      Q => \^o_address_reg[2]\(1),
      R => '0'
    );
\tmp_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[2]_i_1__1_n_0\,
      Q => \^o_address_reg[2]\(2),
      R => '0'
    );
\tmp_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[3]_i_1__1_n_0\,
      Q => rgt_address(3),
      R => '0'
    );
\tmp_address_reg[3]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_address_reg[3]_i_2__0_n_0\,
      CO(2) => \tmp_address_reg[3]_i_2__0_n_1\,
      CO(1) => \tmp_address_reg[3]_i_2__0_n_2\,
      CO(0) => \tmp_address_reg[3]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3) => rgt_address(3),
      DI(2 downto 0) => \^o_address_reg[2]\(2 downto 0),
      O(3) => \tmp_address_reg[3]_i_2__0_n_4\,
      O(2) => \tmp_address_reg[3]_i_2__0_n_5\,
      O(1) => \tmp_address_reg[3]_i_2__0_n_6\,
      O(0) => \tmp_address_reg[3]_i_2__0_n_7\,
      S(3) => \tmp_address[3]_i_3_n_0\,
      S(2) => \tmp_address[3]_i_4_n_0\,
      S(1) => \tmp_address[3]_i_5_n_0\,
      S(0) => \tmp_address[3]_i_6_n_0\
    );
\tmp_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[4]_i_1__1_n_0\,
      Q => rgt_address(4),
      R => '0'
    );
\tmp_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[5]_i_1__1_n_0\,
      Q => rgt_address(5),
      R => '0'
    );
\tmp_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[6]_i_1__1_n_0\,
      Q => rgt_address(6),
      R => '0'
    );
\tmp_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[7]_i_1__1_n_0\,
      Q => rgt_address(7),
      R => '0'
    );
\tmp_address_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[3]_i_2__0_n_0\,
      CO(3) => \tmp_address_reg[7]_i_2__0_n_0\,
      CO(2) => \tmp_address_reg[7]_i_2__0_n_1\,
      CO(1) => \tmp_address_reg[7]_i_2__0_n_2\,
      CO(0) => \tmp_address_reg[7]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => rgt_address(7 downto 4),
      O(3) => \tmp_address_reg[7]_i_2__0_n_4\,
      O(2) => \tmp_address_reg[7]_i_2__0_n_5\,
      O(1) => \tmp_address_reg[7]_i_2__0_n_6\,
      O(0) => \tmp_address_reg[7]_i_2__0_n_7\,
      S(3) => \tmp_address[7]_i_3_n_0\,
      S(2) => \tmp_address[7]_i_4_n_0\,
      S(1) => \tmp_address[7]_i_5_n_0\,
      S(0) => \tmp_address[7]_i_6_n_0\
    );
\tmp_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[8]_i_1__1_n_0\,
      Q => rgt_address(8),
      R => '0'
    );
\tmp_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => tmp_address,
      D => \tmp_address[9]_i_1__1_n_0\,
      Q => rgt_address(9),
      R => '0'
    );
\tmp_area[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \o_area0__0\,
      I1 => i_rst_IBUF,
      O => tmp_area
    );
\tmp_area[0]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(3),
      I1 => tmp_area_reg(3),
      O => \tmp_area[0]_i_3__0_n_0\
    );
\tmp_area[0]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(2),
      I1 => tmp_area_reg(2),
      O => \tmp_area[0]_i_4__2_n_0\
    );
\tmp_area[0]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(1),
      I1 => tmp_area_reg(1),
      O => \tmp_area[0]_i_5__2_n_0\
    );
\tmp_area[0]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(0),
      I1 => tmp_area_reg(0),
      O => \tmp_area[0]_i_6__1_n_0\
    );
\tmp_area[4]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(7),
      I1 => tmp_area_reg(7),
      O => \tmp_area[4]_i_2__2_n_0\
    );
\tmp_area[4]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(6),
      I1 => tmp_area_reg(6),
      O => \tmp_area[4]_i_3__2_n_0\
    );
\tmp_area[4]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(5),
      I1 => tmp_area_reg(5),
      O => \tmp_area[4]_i_4__2_n_0\
    );
\tmp_area[4]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => real_height(4),
      I1 => tmp_area_reg(4),
      O => \tmp_area[4]_i_5__2_n_0\
    );
\tmp_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2__0_n_7\,
      Q => tmp_area_reg(0),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_area_reg[0]_i_2__0_n_0\,
      CO(2) => \tmp_area_reg[0]_i_2__0_n_1\,
      CO(1) => \tmp_area_reg[0]_i_2__0_n_2\,
      CO(0) => \tmp_area_reg[0]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => real_height(3 downto 0),
      O(3) => \tmp_area_reg[0]_i_2__0_n_4\,
      O(2) => \tmp_area_reg[0]_i_2__0_n_5\,
      O(1) => \tmp_area_reg[0]_i_2__0_n_6\,
      O(0) => \tmp_area_reg[0]_i_2__0_n_7\,
      S(3) => \tmp_area[0]_i_3__0_n_0\,
      S(2) => \tmp_area[0]_i_4__2_n_0\,
      S(1) => \tmp_area[0]_i_5__2_n_0\,
      S(0) => \tmp_area[0]_i_6__1_n_0\
    );
\tmp_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__2_n_5\,
      Q => tmp_area_reg(10),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__2_n_4\,
      Q => tmp_area_reg(11),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__2_n_7\,
      Q => tmp_area_reg(12),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[8]_i_1__2_n_0\,
      CO(3) => \NLW_tmp_area_reg[12]_i_1__2_CO_UNCONNECTED\(3),
      CO(2) => \tmp_area_reg[12]_i_1__2_n_1\,
      CO(1) => \tmp_area_reg[12]_i_1__2_n_2\,
      CO(0) => \tmp_area_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[12]_i_1__2_n_4\,
      O(2) => \tmp_area_reg[12]_i_1__2_n_5\,
      O(1) => \tmp_area_reg[12]_i_1__2_n_6\,
      O(0) => \tmp_area_reg[12]_i_1__2_n_7\,
      S(3 downto 0) => tmp_area_reg(15 downto 12)
    );
\tmp_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__2_n_6\,
      Q => tmp_area_reg(13),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__2_n_5\,
      Q => tmp_area_reg(14),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[12]_i_1__2_n_4\,
      Q => tmp_area_reg(15),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2__0_n_6\,
      Q => tmp_area_reg(1),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2__0_n_5\,
      Q => tmp_area_reg(2),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[0]_i_2__0_n_4\,
      Q => tmp_area_reg(3),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__2_n_7\,
      Q => tmp_area_reg(4),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[0]_i_2__0_n_0\,
      CO(3) => \tmp_area_reg[4]_i_1__2_n_0\,
      CO(2) => \tmp_area_reg[4]_i_1__2_n_1\,
      CO(1) => \tmp_area_reg[4]_i_1__2_n_2\,
      CO(0) => \tmp_area_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => real_height(7 downto 4),
      O(3) => \tmp_area_reg[4]_i_1__2_n_4\,
      O(2) => \tmp_area_reg[4]_i_1__2_n_5\,
      O(1) => \tmp_area_reg[4]_i_1__2_n_6\,
      O(0) => \tmp_area_reg[4]_i_1__2_n_7\,
      S(3) => \tmp_area[4]_i_2__2_n_0\,
      S(2) => \tmp_area[4]_i_3__2_n_0\,
      S(1) => \tmp_area[4]_i_4__2_n_0\,
      S(0) => \tmp_area[4]_i_5__2_n_0\
    );
\tmp_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__2_n_6\,
      Q => tmp_area_reg(5),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__2_n_5\,
      Q => tmp_area_reg(6),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[4]_i_1__2_n_4\,
      Q => tmp_area_reg(7),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__2_n_7\,
      Q => tmp_area_reg(8),
      R => \real_height[7]_i_1__0_n_0\
    );
\tmp_area_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[4]_i_1__2_n_0\,
      CO(3) => \tmp_area_reg[8]_i_1__2_n_0\,
      CO(2) => \tmp_area_reg[8]_i_1__2_n_1\,
      CO(1) => \tmp_area_reg[8]_i_1__2_n_2\,
      CO(0) => \tmp_area_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[8]_i_1__2_n_4\,
      O(2) => \tmp_area_reg[8]_i_1__2_n_5\,
      O(1) => \tmp_area_reg[8]_i_1__2_n_6\,
      O(0) => \tmp_area_reg[8]_i_1__2_n_7\,
      S(3 downto 0) => tmp_area_reg(11 downto 8)
    );
\tmp_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_area,
      D => \tmp_area_reg[8]_i_1__2_n_6\,
      Q => tmp_area_reg(9),
      R => \real_height[7]_i_1__0_n_0\
    );
\y[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \y_reg__0\(0),
      O => \plusOp__4\(0)
    );
\y[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      O => \plusOp__4\(1)
    );
\y[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(2),
      O => \plusOp__4\(2)
    );
\y[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(3),
      O => \plusOp__4\(3)
    );
\y[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(3),
      I4 => \y_reg__0\(4),
      O => \plusOp__4\(4)
    );
\y[5]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \y_reg__0\(3),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(2),
      I4 => \y_reg__0\(4),
      I5 => \y_reg__0\(5),
      O => \plusOp__4\(5)
    );
\y[6]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y[7]_i_4__0_n_0\,
      I1 => \y_reg__0\(6),
      O => \plusOp__4\(6)
    );
\y[7]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \tmp_address[15]_i_3__1_n_0\,
      I1 => i_rst_IBUF,
      O => zero
    );
\y[7]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => CO(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => i_rst_IBUF,
      O => y
    );
\y[7]_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y[7]_i_4__0_n_0\,
      I1 => \y_reg__0\(6),
      I2 => \y_reg__0\(7),
      O => \plusOp__4\(7)
    );
\y[7]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(2),
      I5 => \y_reg__0\(4),
      O => \y[7]_i_4__0_n_0\
    );
\y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(0),
      Q => \y_reg__0\(0),
      R => zero
    );
\y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(1),
      Q => \y_reg__0\(1),
      R => zero
    );
\y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(2),
      Q => \y_reg__0\(2),
      R => zero
    );
\y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(3),
      Q => \y_reg__0\(3),
      R => zero
    );
\y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(4),
      Q => \y_reg__0\(4),
      R => zero
    );
\y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(5),
      Q => \y_reg__0\(5),
      R => zero
    );
\y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(6),
      Q => \y_reg__0\(6),
      R => zero
    );
\y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => y,
      D => \plusOp__4\(7),
      Q => \y_reg__0\(7),
      R => zero
    );
zero0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero0_carry_n_0,
      CO(2) => zero0_carry_n_1,
      CO(1) => zero0_carry_n_2,
      CO(0) => zero0_carry_n_3,
      CYINIT => '0',
      DI(3) => Q(2),
      DI(2 downto 0) => \out\(2 downto 0),
      O(3) => zero0_carry_n_4,
      O(2) => zero0_carry_n_5,
      O(1) => zero0_carry_n_6,
      O(0) => zero0_carry_n_7,
      S(3 downto 0) => S(3 downto 0)
    );
\zero0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => zero0_carry_n_0,
      CO(3) => \zero0_carry__0_n_0\,
      CO(2) => \zero0_carry__0_n_1\,
      CO(1) => \zero0_carry__0_n_2\,
      CO(0) => \zero0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => DI(3 downto 0),
      O(3) => \zero0_carry__0_n_4\,
      O(2) => \zero0_carry__0_n_5\,
      O(1) => \zero0_carry__0_n_6\,
      O(0) => \zero0_carry__0_n_7\,
      S(3 downto 0) => \tmp_area_reg[6]_0\(3 downto 0)
    );
\zero0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero0_carry__0_n_0\,
      CO(3) => \zero0_carry__1_n_0\,
      CO(2) => \zero0_carry__1_n_1\,
      CO(1) => \zero0_carry__1_n_2\,
      CO(0) => \zero0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \out\(3),
      O(3) => \zero0_carry__1_n_4\,
      O(2) => \zero0_carry__1_n_5\,
      O(1) => \zero0_carry__1_n_6\,
      O(0) => \zero0_carry__1_n_7\,
      S(3 downto 1) => \out\(6 downto 4),
      S(0) => \tmp_area_reg[7]_0\(0)
    );
\zero0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero0_carry__1_n_0\,
      CO(3) => \NLW_zero0_carry__2_CO_UNCONNECTED\(3),
      CO(2) => \zero0_carry__2_n_1\,
      CO(1) => \zero0_carry__2_n_2\,
      CO(0) => \zero0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero0_carry__2_n_4\,
      O(2) => \zero0_carry__2_n_5\,
      O(1) => \zero0_carry__2_n_6\,
      O(0) => \zero0_carry__2_n_7\,
      S(3 downto 0) => \out\(10 downto 7)
    );
\zero[0]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => zero0_carry_n_4,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(3),
      O => \zero[0]_i_2__0_n_0\
    );
\zero[0]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => zero0_carry_n_5,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(2),
      O => \zero[0]_i_3__0_n_0\
    );
\zero[0]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => zero0_carry_n_6,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(1),
      O => \zero[0]_i_4__0_n_0\
    );
\zero[0]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => zero0_carry_n_7,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(0),
      O => \zero[0]_i_5__0_n_0\
    );
\zero[0]_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(3),
      I1 => zero0_carry_n_4,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[0]_i_6__0_n_0\
    );
\zero[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(2),
      I1 => zero0_carry_n_5,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[0]_i_7_n_0\
    );
\zero[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(1),
      I1 => zero0_carry_n_6,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[0]_i_8_n_0\
    );
\zero[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(0),
      I1 => zero0_carry_n_7,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[0]_i_9_n_0\
    );
\zero[12]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__2_n_5\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(14),
      O => \zero[12]_i_2__0_n_0\
    );
\zero[12]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__2_n_6\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(13),
      O => \zero[12]_i_3__0_n_0\
    );
\zero[12]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__2_n_7\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(12),
      O => \zero[12]_i_4__0_n_0\
    );
\zero[12]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(15),
      I1 => \zero0_carry__2_n_4\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[12]_i_5__0_n_0\
    );
\zero[12]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(14),
      I1 => \zero0_carry__2_n_5\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[12]_i_6_n_0\
    );
\zero[12]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(13),
      I1 => \zero0_carry__2_n_6\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[12]_i_7_n_0\
    );
\zero[12]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(12),
      I1 => \zero0_carry__2_n_7\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[12]_i_8_n_0\
    );
\zero[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__0_n_4\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(7),
      O => \zero[4]_i_2__0_n_0\
    );
\zero[4]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__0_n_5\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(6),
      O => \zero[4]_i_3__0_n_0\
    );
\zero[4]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__0_n_6\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(5),
      O => \zero[4]_i_4__0_n_0\
    );
\zero[4]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__0_n_7\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(4),
      O => \zero[4]_i_5__0_n_0\
    );
\zero[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(7),
      I1 => \zero0_carry__0_n_4\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[4]_i_6_n_0\
    );
\zero[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(6),
      I1 => \zero0_carry__0_n_5\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[4]_i_7_n_0\
    );
\zero[4]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(5),
      I1 => \zero0_carry__0_n_6\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[4]_i_8_n_0\
    );
\zero[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(4),
      I1 => \zero0_carry__0_n_7\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[4]_i_9_n_0\
    );
\zero[8]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__1_n_4\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(11),
      O => \zero[8]_i_2__0_n_0\
    );
\zero[8]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__1_n_5\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(10),
      O => \zero[8]_i_3__0_n_0\
    );
\zero[8]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__1_n_6\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(9),
      O => \zero[8]_i_4__0_n_0\
    );
\zero[8]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => \zero0_carry__1_n_7\,
      I1 => state_0(1),
      I2 => state_0(0),
      I3 => start_rgt,
      I4 => zero_reg(8),
      O => \zero[8]_i_5__0_n_0\
    );
\zero[8]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(11),
      I1 => \zero0_carry__1_n_4\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[8]_i_6_n_0\
    );
\zero[8]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(10),
      I1 => \zero0_carry__1_n_5\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[8]_i_7_n_0\
    );
\zero[8]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(9),
      I1 => \zero0_carry__1_n_6\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[8]_i_8_n_0\
    );
\zero[8]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"555555C5"
    )
        port map (
      I0 => zero_reg(8),
      I1 => \zero0_carry__1_n_7\,
      I2 => start_rgt,
      I3 => state_0(0),
      I4 => state_0(1),
      O => \zero[8]_i_9_n_0\
    );
\zero_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1__0_n_7\,
      Q => zero_reg(0),
      R => '0'
    );
\zero_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \zero_reg[0]_i_1__0_n_0\,
      CO(2) => \zero_reg[0]_i_1__0_n_1\,
      CO(1) => \zero_reg[0]_i_1__0_n_2\,
      CO(0) => \zero_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3) => \zero[0]_i_2__0_n_0\,
      DI(2) => \zero[0]_i_3__0_n_0\,
      DI(1) => \zero[0]_i_4__0_n_0\,
      DI(0) => \zero[0]_i_5__0_n_0\,
      O(3) => \zero_reg[0]_i_1__0_n_4\,
      O(2) => \zero_reg[0]_i_1__0_n_5\,
      O(1) => \zero_reg[0]_i_1__0_n_6\,
      O(0) => \zero_reg[0]_i_1__0_n_7\,
      S(3) => \zero[0]_i_6__0_n_0\,
      S(2) => \zero[0]_i_7_n_0\,
      S(1) => \zero[0]_i_8_n_0\,
      S(0) => \zero[0]_i_9_n_0\
    );
\zero_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1__0_n_5\,
      Q => zero_reg(10),
      R => '0'
    );
\zero_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1__0_n_4\,
      Q => zero_reg(11),
      R => '0'
    );
\zero_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1__0_n_7\,
      Q => zero_reg(12),
      R => '0'
    );
\zero_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[8]_i_1__0_n_0\,
      CO(3) => \NLW_zero_reg[12]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \zero_reg[12]_i_1__0_n_1\,
      CO(1) => \zero_reg[12]_i_1__0_n_2\,
      CO(0) => \zero_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \zero[12]_i_2__0_n_0\,
      DI(1) => \zero[12]_i_3__0_n_0\,
      DI(0) => \zero[12]_i_4__0_n_0\,
      O(3) => \zero_reg[12]_i_1__0_n_4\,
      O(2) => \zero_reg[12]_i_1__0_n_5\,
      O(1) => \zero_reg[12]_i_1__0_n_6\,
      O(0) => \zero_reg[12]_i_1__0_n_7\,
      S(3) => \zero[12]_i_5__0_n_0\,
      S(2) => \zero[12]_i_6_n_0\,
      S(1) => \zero[12]_i_7_n_0\,
      S(0) => \zero[12]_i_8_n_0\
    );
\zero_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1__0_n_6\,
      Q => zero_reg(13),
      R => '0'
    );
\zero_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1__0_n_5\,
      Q => zero_reg(14),
      R => '0'
    );
\zero_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[12]_i_1__0_n_4\,
      Q => zero_reg(15),
      R => '0'
    );
\zero_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1__0_n_6\,
      Q => zero_reg(1),
      R => '0'
    );
\zero_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1__0_n_5\,
      Q => zero_reg(2),
      R => '0'
    );
\zero_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[0]_i_1__0_n_4\,
      Q => zero_reg(3),
      R => '0'
    );
\zero_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1__0_n_7\,
      Q => zero_reg(4),
      R => '0'
    );
\zero_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[0]_i_1__0_n_0\,
      CO(3) => \zero_reg[4]_i_1__0_n_0\,
      CO(2) => \zero_reg[4]_i_1__0_n_1\,
      CO(1) => \zero_reg[4]_i_1__0_n_2\,
      CO(0) => \zero_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3) => \zero[4]_i_2__0_n_0\,
      DI(2) => \zero[4]_i_3__0_n_0\,
      DI(1) => \zero[4]_i_4__0_n_0\,
      DI(0) => \zero[4]_i_5__0_n_0\,
      O(3) => \zero_reg[4]_i_1__0_n_4\,
      O(2) => \zero_reg[4]_i_1__0_n_5\,
      O(1) => \zero_reg[4]_i_1__0_n_6\,
      O(0) => \zero_reg[4]_i_1__0_n_7\,
      S(3) => \zero[4]_i_6_n_0\,
      S(2) => \zero[4]_i_7_n_0\,
      S(1) => \zero[4]_i_8_n_0\,
      S(0) => \zero[4]_i_9_n_0\
    );
\zero_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1__0_n_6\,
      Q => zero_reg(5),
      R => '0'
    );
\zero_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1__0_n_5\,
      Q => zero_reg(6),
      R => '0'
    );
\zero_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[4]_i_1__0_n_4\,
      Q => zero_reg(7),
      R => '0'
    );
\zero_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1__0_n_7\,
      Q => zero_reg(8),
      R => '0'
    );
\zero_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_reg[4]_i_1__0_n_0\,
      CO(3) => \zero_reg[8]_i_1__0_n_0\,
      CO(2) => \zero_reg[8]_i_1__0_n_1\,
      CO(1) => \zero_reg[8]_i_1__0_n_2\,
      CO(0) => \zero_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3) => \zero[8]_i_2__0_n_0\,
      DI(2) => \zero[8]_i_3__0_n_0\,
      DI(1) => \zero[8]_i_4__0_n_0\,
      DI(0) => \zero[8]_i_5__0_n_0\,
      O(3) => \zero_reg[8]_i_1__0_n_4\,
      O(2) => \zero_reg[8]_i_1__0_n_5\,
      O(1) => \zero_reg[8]_i_1__0_n_6\,
      O(0) => \zero_reg[8]_i_1__0_n_7\,
      S(3) => \zero[8]_i_6_n_0\,
      S(2) => \zero[8]_i_7_n_0\,
      S(1) => \zero[8]_i_8_n_0\,
      S(0) => \zero[8]_i_9_n_0\
    );
\zero_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => zero,
      D => \zero_reg[8]_i_1__0_n_6\,
      Q => zero_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity comp_top is
  port (
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[2]\ : out STD_LOGIC;
    \o_address_reg[0]_0\ : out STD_LOGIC;
    \o_address_reg[1]_0\ : out STD_LOGIC;
    \o_address_reg[2]_0\ : out STD_LOGIC;
    \o_address_reg[3]_0\ : out STD_LOGIC;
    \o_address_reg[4]_0\ : out STD_LOGIC;
    \o_address_reg[5]_0\ : out STD_LOGIC;
    \o_address_reg[6]_0\ : out STD_LOGIC;
    \o_address_reg[7]_0\ : out STD_LOGIC;
    \o_address_reg[8]_0\ : out STD_LOGIC;
    \o_address_reg[9]_0\ : out STD_LOGIC;
    \o_address_reg[10]_0\ : out STD_LOGIC;
    \o_address_reg[11]_0\ : out STD_LOGIC;
    \o_address_reg[12]_0\ : out STD_LOGIC;
    \o_address_reg[13]_0\ : out STD_LOGIC;
    \o_address_reg[14]_0\ : out STD_LOGIC;
    \o_address_reg[15]_0\ : out STD_LOGIC;
    start_lft_reg : out STD_LOGIC;
    state176_out : out STD_LOGIC;
    state180_out : out STD_LOGIC;
    start_rgt_reg : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \state_reg[1]_0\ : out STD_LOGIC;
    \state_reg[3]\ : out STD_LOGIC;
    o_done_reg : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_we_reg : out STD_LOGIC;
    o_en_reg : out STD_LOGIC;
    \tmp_address_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \tmp_address_reg[4]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    start_bot_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \tmp_address_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \tmp_address_reg[7]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \tmp_address_reg[11]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[0]_0\ : out STD_LOGIC;
    \real_height_reg[7]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    i_clk : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_rst_IBUF : in STD_LOGIC;
    i_clk_IBUF_BUFG : in STD_LOGIC;
    \state_reg[1]_1\ : in STD_LOGIC;
    \p_1_in__1\ : in STD_LOGIC;
    \state_reg[1]_2\ : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \state_reg[1]_3\ : in STD_LOGIC;
    start_top : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \width_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \o_address_reg[15]_1\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \state_reg[2]_0\ : in STD_LOGIC;
    state174_out : in STD_LOGIC;
    \tmp_address_reg[15]_0\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \state_reg[3]_0\ : in STD_LOGIC;
    start_lft : in STD_LOGIC;
    p_51_in : in STD_LOGIC;
    state172_out : in STD_LOGIC;
    start_rgt : in STD_LOGIC;
    \state_reg[1]_4\ : in STD_LOGIC;
    o_end_reg_0 : in STD_LOGIC;
    \o_area_reg[14]\ : in STD_LOGIC_VECTOR ( 13 downto 0 );
    \o_area_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \total_area_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \tmp_area_reg[15]_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    o_end_reg_1 : in STD_LOGIC;
    \o_area_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \o_area_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[3]_1\ : in STD_LOGIC;
    state1 : in STD_LOGIC;
    \o_area_reg[15]_0\ : in STD_LOGIC;
    \state_reg[0]_1\ : in STD_LOGIC;
    \state_reg[2]_1\ : in STD_LOGIC;
    o_end_reg_2 : in STD_LOGIC;
    \state_reg[1]_5\ : in STD_LOGIC;
    \state_reg[3]_2\ : in STD_LOGIC;
    multiplied : in STD_LOGIC;
    i_start_IBUF : in STD_LOGIC;
    start_bot : in STD_LOGIC
  );
end comp_top;

architecture STRUCTURE of comp_top is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \o_address[0]_i_4_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_10_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_3__1_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_4_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_5_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_6__1_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_7__0_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_7_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_8_n_0\ : STD_LOGIC;
  signal \o_address[15]_i_9_n_0\ : STD_LOGIC;
  signal \o_address[1]_i_4_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_12_n_0\ : STD_LOGIC;
  signal o_done_i_3_n_0 : STD_LOGIC;
  signal o_end : STD_LOGIC;
  signal o_end2_out : STD_LOGIC;
  signal o_end_i_1_n_0 : STD_LOGIC;
  signal o_we_i_10_n_0 : STD_LOGIC;
  signal o_we_i_5_n_0 : STD_LOGIC;
  signal o_we_i_6_n_0 : STD_LOGIC;
  signal o_we_i_7_n_0 : STD_LOGIC;
  signal o_we_i_8_n_0 : STD_LOGIC;
  signal o_we_i_9_n_0 : STD_LOGIC;
  signal o_we_reg_i_3_n_3 : STD_LOGIC;
  signal o_we_reg_i_4_n_0 : STD_LOGIC;
  signal o_we_reg_i_4_n_1 : STD_LOGIC;
  signal o_we_reg_i_4_n_2 : STD_LOGIC;
  signal o_we_reg_i_4_n_3 : STD_LOGIC;
  signal \o_y[7]_i_2_n_0\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in5_in : STD_LOGIC;
  signal \p_1_in__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_2_in : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal p_57_in : STD_LOGIC;
  signal p_79_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal start_lft_i_2_n_0 : STD_LOGIC;
  signal state110_out : STD_LOGIC;
  signal \^state176_out\ : STD_LOGIC;
  signal state17_out : STD_LOGIC;
  signal \^state180_out\ : STD_LOGIC;
  signal state19_out : STD_LOGIC;
  signal state278_in : STD_LOGIC;
  signal \state2_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \state2_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \state2_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[0]_i_4_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[2]_i_2_n_0\ : STD_LOGIC;
  signal state_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal tmp_address : STD_LOGIC;
  signal \tmp_address[0]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[0]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[0]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_address[0]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_address[0]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[12]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[4]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_address[8]_i_5_n_0\ : STD_LOGIC;
  signal tmp_address_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tmp_address_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_address_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_area[0]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \tmp_area[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_area[11]_i_9_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_10_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_11_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_16_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_17_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_area[15]_i_9_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_area[3]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \tmp_area[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_area[7]_i_9_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[15]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \tmp_area_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \tmp_area_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal top_address : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal x : STD_LOGIC;
  signal \x[7]_i_1_n_0\ : STD_LOGIC;
  signal \x[7]_i_2_n_0\ : STD_LOGIC;
  signal \x[7]_i_4_n_0\ : STD_LOGIC;
  signal \x_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \y[7]_i_3_n_0\ : STD_LOGIC;
  signal \y_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_o_we_reg_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_o_we_reg_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_o_we_reg_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_plusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_state2_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_tmp_address_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_area_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_area_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_address[15]_i_3__1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \o_address[15]_i_5\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \o_address[15]_i_7__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \o_address[15]_i_9\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \o_address[2]_i_13\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \o_y[7]_i_2\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of start_bot_i_1 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of start_rgt_i_2 : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \state[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \state[1]_i_3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \state[1]_i_4\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \state[3]_i_3\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \tmp_area[11]_i_14\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \tmp_area[11]_i_15\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \tmp_area[11]_i_16\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \tmp_area[11]_i_17\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \tmp_area[15]_i_16\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \tmp_area[15]_i_18\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \tmp_area[15]_i_19\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \tmp_area[15]_i_20\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \tmp_area[3]_i_12\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \tmp_area[3]_i_13\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \tmp_area[3]_i_14\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \tmp_area[7]_i_14\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \tmp_area[7]_i_15\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \tmp_area[7]_i_16\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \tmp_area[7]_i_17\ : label is "soft_lutpair52";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \tmp_area_reg[11]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \tmp_area_reg[15]_i_2\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \tmp_area_reg[3]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \tmp_area_reg[7]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \x[0]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \x[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \x[2]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \x[3]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \x[4]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \x[6]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \x[7]_i_3\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \y[0]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \y[1]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \y[2]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \y[3]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \y[4]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \y[6]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \y[7]_i_2__1\ : label is "soft_lutpair43";
begin
  CO(0) <= \^co\(0);
  \out\(15 downto 0) <= \^out\(15 downto 0);
  state176_out <= \^state176_out\;
  state180_out <= \^state180_out\;
\o_address[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tmp_address_reg(0),
      O => plusOp(0)
    );
\o_address[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F0F022EA"
    )
        port map (
      I0 => \o_address[0]_i_4_n_0\,
      I1 => p_79_in,
      I2 => \o_address_reg[15]_1\(0),
      I3 => state278_in,
      I4 => \state_reg[2]_0\,
      I5 => state174_out,
      O => \o_address_reg[0]_0\
    );
\o_address[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008C0000088C"
    )
        port map (
      I0 => top_address(0),
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      I5 => o_end,
      O => \o_address[0]_i_4_n_0\
    );
\o_address[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(7),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(10),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(10),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[10]_0\
    );
\o_address[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(8),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(11),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(11),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[11]_0\
    );
\o_address[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(9),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(12),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(12),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[12]_0\
    );
\o_address[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(10),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(13),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(13),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[13]_0\
    );
\o_address[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(11),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(14),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(14),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[14]_0\
    );
\o_address[15]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => Q(4),
      I1 => \y_reg__0\(4),
      I2 => Q(3),
      I3 => \y_reg__0\(3),
      O => \o_address[15]_i_10_n_0\
    );
\o_address[15]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000554500000000"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      I4 => state19_out,
      I5 => \o_address[15]_i_3__1_n_0\,
      O => \o_address[15]_i_1__0_n_0\
    );
\o_address[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => \o_address[15]_i_4_n_0\,
      I1 => \width_reg[7]\(5),
      I2 => \x_reg__0\(5),
      I3 => \width_reg[7]\(2),
      I4 => \x_reg__0\(2),
      I5 => \o_address[15]_i_5_n_0\,
      O => state19_out
    );
\o_address[15]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^co\(0),
      I1 => state_0(0),
      I2 => state_0(1),
      I3 => state17_out,
      O => \o_address[15]_i_3__1_n_0\
    );
\o_address[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4004000000004004"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => \x_reg__0\(6),
      I3 => \width_reg[7]\(6),
      I4 => \x_reg__0\(7),
      I5 => \width_reg[7]\(7),
      O => \o_address[15]_i_4_n_0\
    );
\o_address[15]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(12),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(15),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(15),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[15]_0\
    );
\o_address[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => \x_reg__0\(0),
      I1 => \width_reg[7]\(0),
      I2 => \x_reg__0\(1),
      I3 => \width_reg[7]\(1),
      I4 => \o_address[15]_i_7_n_0\,
      O => \o_address[15]_i_5_n_0\
    );
\o_address[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => \o_address[15]_i_8_n_0\,
      I1 => Q(5),
      I2 => \y_reg__0\(5),
      I3 => Q(2),
      I4 => \y_reg__0\(2),
      I5 => \o_address[15]_i_9_n_0\,
      O => state17_out
    );
\o_address[15]_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000F4000000000"
    )
        port map (
      I0 => state278_in,
      I1 => o_end,
      I2 => state(0),
      I3 => state(1),
      I4 => state(3),
      I5 => state(2),
      O => \o_address[15]_i_6__1_n_0\
    );
\o_address[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \width_reg[7]\(4),
      I1 => \x_reg__0\(4),
      I2 => \width_reg[7]\(3),
      I3 => \x_reg__0\(3),
      O => \o_address[15]_i_7_n_0\
    );
\o_address[15]_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080028"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      I4 => o_end,
      O => \o_address[15]_i_7__0_n_0\
    );
\o_address[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4004000000004004"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => \y_reg__0\(6),
      I3 => Q(6),
      I4 => \y_reg__0\(7),
      I5 => Q(7),
      O => \o_address[15]_i_8_n_0\
    );
\o_address[15]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => Q(0),
      I2 => \y_reg__0\(1),
      I3 => Q(1),
      I4 => \o_address[15]_i_10_n_0\,
      O => \o_address[15]_i_9_n_0\
    );
\o_address[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F0F022EA"
    )
        port map (
      I0 => \o_address[1]_i_4_n_0\,
      I1 => p_79_in,
      I2 => \o_address_reg[15]_1\(1),
      I3 => state278_in,
      I4 => \state_reg[2]_0\,
      I5 => state174_out,
      O => \o_address_reg[1]_0\
    );
\o_address[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF38FFFFFFB8F"
    )
        port map (
      I0 => top_address(1),
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      I5 => o_end,
      O => \o_address[1]_i_4_n_0\
    );
\o_address[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F0F022EA"
    )
        port map (
      I0 => \o_address[2]_i_12_n_0\,
      I1 => p_79_in,
      I2 => \o_address_reg[15]_1\(2),
      I3 => state278_in,
      I4 => \state_reg[2]_0\,
      I5 => state174_out,
      O => \o_address_reg[2]_0\
    );
\o_address[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000B0000008B0"
    )
        port map (
      I0 => top_address(2),
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      I5 => o_end,
      O => \o_address[2]_i_12_n_0\
    );
\o_address[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => o_end,
      I1 => state(3),
      I2 => state(2),
      I3 => state(1),
      I4 => state(0),
      O => p_79_in
    );
\o_address[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080000000000"
    )
        port map (
      I0 => state278_in,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      I5 => o_end,
      O => \^state180_out\
    );
\o_address[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(0),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(3),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(3),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[3]_0\
    );
\o_address[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(1),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(4),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(4),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[4]_0\
    );
\o_address[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(2),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(5),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(5),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[5]_0\
    );
\o_address[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(3),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(6),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(6),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[6]_0\
    );
\o_address[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(4),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(7),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(7),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[7]_0\
    );
\o_address[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(5),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(8),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(8),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[8]_0\
    );
\o_address[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB888B888B888"
    )
        port map (
      I0 => \tmp_address_reg[15]_0\(6),
      I1 => \state_reg[3]_0\,
      I2 => \o_address_reg[15]_1\(9),
      I3 => \o_address[15]_i_6__1_n_0\,
      I4 => top_address(9),
      I5 => \o_address[15]_i_7__0_n_0\,
      O => \o_address_reg[9]_0\
    );
\o_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(0),
      Q => top_address(0),
      R => '0'
    );
\o_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(10),
      Q => top_address(10),
      R => '0'
    );
\o_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(11),
      Q => top_address(11),
      R => '0'
    );
\o_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(12),
      Q => top_address(12),
      R => '0'
    );
\o_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(13),
      Q => top_address(13),
      R => '0'
    );
\o_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(14),
      Q => top_address(14),
      R => '0'
    );
\o_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(15),
      Q => top_address(15),
      R => '0'
    );
\o_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(1),
      Q => top_address(1),
      R => '0'
    );
\o_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(2),
      Q => top_address(2),
      R => '0'
    );
\o_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(3),
      Q => top_address(3),
      R => '0'
    );
\o_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(4),
      Q => top_address(4),
      R => '0'
    );
\o_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(5),
      Q => top_address(5),
      R => '0'
    );
\o_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(6),
      Q => top_address(6),
      R => '0'
    );
\o_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(7),
      Q => top_address(7),
      R => '0'
    );
\o_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(8),
      Q => top_address(8),
      R => '0'
    );
\o_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \o_address[15]_i_1__0_n_0\,
      D => plusOp(9),
      Q => top_address(9),
      R => '0'
    );
\o_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222220002"
    )
        port map (
      I0 => \^state180_out\,
      I1 => \state_reg[1]_1\,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => SR(0)
    );
o_done_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => o_done_i_3_n_0,
      I1 => state1,
      I2 => \state_reg[0]_1\,
      O => o_done_reg
    );
o_done_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000040"
    )
        port map (
      I0 => \^state180_out\,
      I1 => state(3),
      I2 => state(2),
      I3 => state(0),
      I4 => state(1),
      O => o_done_i_3_n_0
    );
o_en_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF04410440"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      I4 => i_start_IBUF,
      I5 => \^state180_out\,
      O => o_en_reg
    );
o_end_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF22222022"
    )
        port map (
      I0 => \o_y[7]_i_2_n_0\,
      I1 => state19_out,
      I2 => state_0(0),
      I3 => start_top,
      I4 => state_0(1),
      I5 => o_end,
      O => o_end_i_1_n_0
    );
o_end_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => o_end_i_1_n_0,
      Q => o_end,
      R => i_rst_IBUF
    );
o_we_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^out\(1),
      I1 => \total_area_reg[15]\(1),
      I2 => \^out\(0),
      I3 => \total_area_reg[15]\(0),
      I4 => \total_area_reg[15]\(2),
      I5 => \^out\(2),
      O => o_we_i_10_n_0
    );
o_we_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000008000FF00000"
    )
        port map (
      I0 => o_end,
      I1 => state278_in,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => o_we_reg
    );
o_we_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \total_area_reg[15]\(15),
      I1 => \^out\(15),
      O => o_we_i_5_n_0
    );
o_we_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^out\(13),
      I1 => \total_area_reg[15]\(13),
      I2 => \^out\(12),
      I3 => \total_area_reg[15]\(12),
      I4 => \total_area_reg[15]\(14),
      I5 => \^out\(14),
      O => o_we_i_6_n_0
    );
o_we_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^out\(10),
      I1 => \total_area_reg[15]\(10),
      I2 => \^out\(9),
      I3 => \total_area_reg[15]\(9),
      I4 => \total_area_reg[15]\(11),
      I5 => \^out\(11),
      O => o_we_i_7_n_0
    );
o_we_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^out\(7),
      I1 => \total_area_reg[15]\(7),
      I2 => \^out\(6),
      I3 => \total_area_reg[15]\(6),
      I4 => \total_area_reg[15]\(8),
      I5 => \^out\(8),
      O => o_we_i_8_n_0
    );
o_we_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^out\(4),
      I1 => \total_area_reg[15]\(4),
      I2 => \^out\(3),
      I3 => \total_area_reg[15]\(3),
      I4 => \total_area_reg[15]\(5),
      I5 => \^out\(5),
      O => o_we_i_9_n_0
    );
o_we_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => o_we_reg_i_4_n_0,
      CO(3 downto 2) => NLW_o_we_reg_i_3_CO_UNCONNECTED(3 downto 2),
      CO(1) => state278_in,
      CO(0) => o_we_reg_i_3_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_o_we_reg_i_3_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => o_we_i_5_n_0,
      S(0) => o_we_i_6_n_0
    );
o_we_reg_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => o_we_reg_i_4_n_0,
      CO(2) => o_we_reg_i_4_n_1,
      CO(1) => o_we_reg_i_4_n_2,
      CO(0) => o_we_reg_i_4_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_o_we_reg_i_4_O_UNCONNECTED(3 downto 0),
      S(3) => o_we_i_7_n_0,
      S(2) => o_we_i_8_n_0,
      S(1) => o_we_i_9_n_0,
      S(0) => o_we_i_10_n_0
    );
\o_y[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FB0000"
    )
        port map (
      I0 => state_0(1),
      I1 => start_top,
      I2 => state_0(0),
      I3 => state19_out,
      I4 => \o_y[7]_i_2_n_0\,
      O => o_end2_out
    );
\o_y[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF04"
    )
        port map (
      I0 => state_0(1),
      I1 => state_0(0),
      I2 => \^co\(0),
      I3 => state17_out,
      O => \o_y[7]_i_2_n_0\
    );
\o_y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(0),
      Q => \real_height_reg[7]\(0),
      R => i_rst_IBUF
    );
\o_y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(1),
      Q => \real_height_reg[7]\(1),
      R => i_rst_IBUF
    );
\o_y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(2),
      Q => \real_height_reg[7]\(2),
      R => i_rst_IBUF
    );
\o_y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(3),
      Q => \real_height_reg[7]\(3),
      R => i_rst_IBUF
    );
\o_y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(4),
      Q => \real_height_reg[7]\(4),
      R => i_rst_IBUF
    );
\o_y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(5),
      Q => \real_height_reg[7]\(5),
      R => i_rst_IBUF
    );
\o_y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(6),
      Q => \real_height_reg[7]\(6),
      R => i_rst_IBUF
    );
\o_y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => o_end2_out,
      D => \y_reg__0\(7),
      Q => \real_height_reg[7]\(7),
      R => i_rst_IBUF
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => tmp_address_reg(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(4 downto 1),
      S(3 downto 0) => tmp_address_reg(4 downto 1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(8 downto 5),
      S(3 downto 0) => tmp_address_reg(8 downto 5)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => plusOp(12 downto 9),
      S(3 downto 0) => tmp_address_reg(12 downto 9)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3 downto 2) => \NLW_plusOp_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => plusOp(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => tmp_address_reg(15 downto 13)
    );
start_bot_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF20"
    )
        port map (
      I0 => \^state176_out\,
      I1 => \^state180_out\,
      I2 => p_51_in,
      I3 => start_bot,
      O => start_bot_reg
    );
start_bot_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080000000000"
    )
        port map (
      I0 => multiplied,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => state(3),
      I5 => o_end,
      O => \^state176_out\
    );
start_lft_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAEAAAA000C0008"
    )
        port map (
      I0 => start_lft,
      I1 => p_51_in,
      I2 => \^state176_out\,
      I3 => \^state180_out\,
      I4 => state174_out,
      I5 => start_lft_i_2_n_0,
      O => start_lft_reg
    );
start_lft_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFEFEFEFE"
    )
        port map (
      I0 => \^state180_out\,
      I1 => \^state176_out\,
      I2 => \state_reg[1]_1\,
      I3 => state(1),
      I4 => state(0),
      I5 => \state_reg[3]_2\,
      O => start_lft_i_2_n_0
    );
start_rgt_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCECC0E0"
    )
        port map (
      I0 => state172_out,
      I1 => start_rgt,
      I2 => p_57_in,
      I3 => state174_out,
      I4 => start_lft_i_2_n_0,
      O => start_rgt_reg
    );
start_rgt_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^state180_out\,
      I1 => \^state176_out\,
      I2 => p_51_in,
      O => p_57_in
    );
\state2_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \^co\(0),
      CO(2) => \state2_inferred__0/i__carry_n_1\,
      CO(1) => \state2_inferred__0/i__carry_n_2\,
      CO(0) => \state2_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => DI(3 downto 0),
      O(3 downto 0) => \NLW_state2_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA04AA"
    )
        port map (
      I0 => state_0(0),
      I1 => start_top,
      I2 => state_0(1),
      I3 => \state[1]_i_2_n_0\,
      I4 => i_rst_IBUF,
      O => \state[0]_i_1_n_0\
    );
\state[0]_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0AEAAAAF0ACFF00"
    )
        port map (
      I0 => \state[0]_i_2_n_0\,
      I1 => i_start_IBUF,
      I2 => state(1),
      I3 => state(0),
      I4 => \state_reg[3]_2\,
      I5 => \state[0]_i_4_n_0\,
      O => \state_reg[0]_0\
    );
\state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDDDFD"
    )
        port map (
      I0 => \state_reg[1]_4\,
      I1 => \p_1_in__1\,
      I2 => o_end_reg_0,
      I3 => \^state176_out\,
      I4 => \^state180_out\,
      O => \state[0]_i_2_n_0\
    );
\state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFFFEFFFEFE"
    )
        port map (
      I0 => \p_1_in__1\,
      I1 => \^state180_out\,
      I2 => \state_reg[0]_1\,
      I3 => \state_reg[2]_1\,
      I4 => o_end_reg_2,
      I5 => \state_reg[1]_5\,
      O => \state[0]_i_4_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFF0D00"
    )
        port map (
      I0 => start_top,
      I1 => state_0(0),
      I2 => i_rst_IBUF,
      I3 => \state[1]_i_2_n_0\,
      I4 => state_0(1),
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5504"
    )
        port map (
      I0 => state19_out,
      I1 => p_0_in5_in,
      I2 => \^co\(0),
      I3 => state17_out,
      I4 => state110_out,
      I5 => i_rst_IBUF,
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEFEFF"
    )
        port map (
      I0 => \^state176_out\,
      I1 => state174_out,
      I2 => \^state180_out\,
      I3 => \state_reg[3]_1\,
      I4 => state172_out,
      I5 => state1,
      O => \state_reg[1]_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state_0(0),
      I1 => state_0(1),
      O => p_0_in5_in
    );
\state[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state_0(1),
      I1 => start_top,
      I2 => state_0(0),
      O => state110_out
    );
\state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5455545000000000"
    )
        port map (
      I0 => \state_reg[1]_1\,
      I1 => \state[2]_i_2_n_0\,
      I2 => \p_1_in__1\,
      I3 => \state_reg[1]_2\,
      I4 => state(2),
      I5 => \state_reg[1]_3\,
      O => \state_reg[2]\
    );
\state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEEFEEEE"
    )
        port map (
      I0 => \^state176_out\,
      I1 => state174_out,
      I2 => state1,
      I3 => state172_out,
      I4 => \state_reg[3]_1\,
      I5 => \^state180_out\,
      O => \state[2]_i_2_n_0\
    );
\state[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => \^state180_out\,
      I1 => state174_out,
      I2 => \^state176_out\,
      O => \state_reg[3]\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => state_0(0),
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => state_0(1),
      R => '0'
    );
\tmp_address[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02020202020F0202"
    )
        port map (
      I0 => \o_address[15]_i_3__1_n_0\,
      I1 => state19_out,
      I2 => i_rst_IBUF,
      I3 => state_0(1),
      I4 => start_top,
      I5 => state_0(0),
      O => tmp_address
    );
\tmp_address[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF04"
    )
        port map (
      I0 => state_0(0),
      I1 => start_top,
      I2 => state_0(1),
      I3 => tmp_address_reg(0),
      O => \tmp_address[0]_i_4_n_0\
    );
\tmp_address[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(3),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[0]_i_5_n_0\
    );
\tmp_address[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF04"
    )
        port map (
      I0 => state_0(0),
      I1 => start_top,
      I2 => state_0(1),
      I3 => tmp_address_reg(2),
      O => \tmp_address[0]_i_6_n_0\
    );
\tmp_address[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(1),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[0]_i_7_n_0\
    );
\tmp_address[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5575"
    )
        port map (
      I0 => tmp_address_reg(0),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[0]_i_8_n_0\
    );
\tmp_address[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(15),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[12]_i_2_n_0\
    );
\tmp_address[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(14),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[12]_i_3_n_0\
    );
\tmp_address[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(13),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[12]_i_4_n_0\
    );
\tmp_address[12]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(12),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[12]_i_5_n_0\
    );
\tmp_address[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(7),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[4]_i_2_n_0\
    );
\tmp_address[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(6),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[4]_i_3_n_0\
    );
\tmp_address[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(5),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[4]_i_4_n_0\
    );
\tmp_address[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(4),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[4]_i_5_n_0\
    );
\tmp_address[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(11),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[8]_i_2_n_0\
    );
\tmp_address[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(10),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[8]_i_3_n_0\
    );
\tmp_address[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(9),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[8]_i_4_n_0\
    );
\tmp_address[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => tmp_address_reg(8),
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \tmp_address[8]_i_5_n_0\
    );
\tmp_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[0]_i_2_n_7\,
      Q => tmp_address_reg(0),
      R => '0'
    );
\tmp_address_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_address_reg[0]_i_2_n_0\,
      CO(2) => \tmp_address_reg[0]_i_2_n_1\,
      CO(1) => \tmp_address_reg[0]_i_2_n_2\,
      CO(0) => \tmp_address_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \tmp_address[0]_i_4_n_0\,
      O(3) => \tmp_address_reg[0]_i_2_n_4\,
      O(2) => \tmp_address_reg[0]_i_2_n_5\,
      O(1) => \tmp_address_reg[0]_i_2_n_6\,
      O(0) => \tmp_address_reg[0]_i_2_n_7\,
      S(3) => \tmp_address[0]_i_5_n_0\,
      S(2) => \tmp_address[0]_i_6_n_0\,
      S(1) => \tmp_address[0]_i_7_n_0\,
      S(0) => \tmp_address[0]_i_8_n_0\
    );
\tmp_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[8]_i_1_n_5\,
      Q => tmp_address_reg(10),
      R => '0'
    );
\tmp_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[8]_i_1_n_4\,
      Q => tmp_address_reg(11),
      R => '0'
    );
\tmp_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[12]_i_1_n_7\,
      Q => tmp_address_reg(12),
      R => '0'
    );
\tmp_address_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[8]_i_1_n_0\,
      CO(3) => \NLW_tmp_address_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \tmp_address_reg[12]_i_1_n_1\,
      CO(1) => \tmp_address_reg[12]_i_1_n_2\,
      CO(0) => \tmp_address_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[12]_i_1_n_4\,
      O(2) => \tmp_address_reg[12]_i_1_n_5\,
      O(1) => \tmp_address_reg[12]_i_1_n_6\,
      O(0) => \tmp_address_reg[12]_i_1_n_7\,
      S(3) => \tmp_address[12]_i_2_n_0\,
      S(2) => \tmp_address[12]_i_3_n_0\,
      S(1) => \tmp_address[12]_i_4_n_0\,
      S(0) => \tmp_address[12]_i_5_n_0\
    );
\tmp_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[12]_i_1_n_6\,
      Q => tmp_address_reg(13),
      R => '0'
    );
\tmp_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[12]_i_1_n_5\,
      Q => tmp_address_reg(14),
      R => '0'
    );
\tmp_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[12]_i_1_n_4\,
      Q => tmp_address_reg(15),
      R => '0'
    );
\tmp_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[0]_i_2_n_6\,
      Q => tmp_address_reg(1),
      R => '0'
    );
\tmp_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[0]_i_2_n_5\,
      Q => tmp_address_reg(2),
      R => '0'
    );
\tmp_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[0]_i_2_n_4\,
      Q => tmp_address_reg(3),
      R => '0'
    );
\tmp_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[4]_i_1_n_7\,
      Q => tmp_address_reg(4),
      R => '0'
    );
\tmp_address_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[0]_i_2_n_0\,
      CO(3) => \tmp_address_reg[4]_i_1_n_0\,
      CO(2) => \tmp_address_reg[4]_i_1_n_1\,
      CO(1) => \tmp_address_reg[4]_i_1_n_2\,
      CO(0) => \tmp_address_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[4]_i_1_n_4\,
      O(2) => \tmp_address_reg[4]_i_1_n_5\,
      O(1) => \tmp_address_reg[4]_i_1_n_6\,
      O(0) => \tmp_address_reg[4]_i_1_n_7\,
      S(3) => \tmp_address[4]_i_2_n_0\,
      S(2) => \tmp_address[4]_i_3_n_0\,
      S(1) => \tmp_address[4]_i_4_n_0\,
      S(0) => \tmp_address[4]_i_5_n_0\
    );
\tmp_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[4]_i_1_n_6\,
      Q => tmp_address_reg(5),
      R => '0'
    );
\tmp_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[4]_i_1_n_5\,
      Q => tmp_address_reg(6),
      R => '0'
    );
\tmp_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[4]_i_1_n_4\,
      Q => tmp_address_reg(7),
      R => '0'
    );
\tmp_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[8]_i_1_n_7\,
      Q => tmp_address_reg(8),
      R => '0'
    );
\tmp_address_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_address_reg[4]_i_1_n_0\,
      CO(3) => \tmp_address_reg[8]_i_1_n_0\,
      CO(2) => \tmp_address_reg[8]_i_1_n_1\,
      CO(1) => \tmp_address_reg[8]_i_1_n_2\,
      CO(0) => \tmp_address_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_address_reg[8]_i_1_n_4\,
      O(2) => \tmp_address_reg[8]_i_1_n_5\,
      O(1) => \tmp_address_reg[8]_i_1_n_6\,
      O(0) => \tmp_address_reg[8]_i_1_n_7\,
      S(3) => \tmp_address[8]_i_2_n_0\,
      S(2) => \tmp_address[8]_i_3_n_0\,
      S(1) => \tmp_address[8]_i_4_n_0\,
      S(0) => \tmp_address[8]_i_5_n_0\
    );
\tmp_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => tmp_address,
      D => \tmp_address_reg[8]_i_1_n_6\,
      Q => tmp_address_reg(9),
      R => '0'
    );
\tmp_area[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(3),
      I1 => \^out\(3),
      O => \tmp_area[0]_i_2_n_0\
    );
\tmp_area[0]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^out\(2),
      I1 => \width_reg[7]\(2),
      O => \tmp_area[0]_i_3__1_n_0\
    );
\tmp_area[0]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(1),
      I1 => \^out\(1),
      O => \tmp_area[0]_i_4__0_n_0\
    );
\tmp_area[0]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(0),
      I1 => \^out\(0),
      O => \tmp_area[0]_i_5__0_n_0\
    );
\tmp_area[11]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(11),
      O => p_2_in(11)
    );
\tmp_area[11]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(10),
      O => p_2_in(10)
    );
\tmp_area[11]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(9),
      O => p_2_in(9)
    );
\tmp_area[11]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(8),
      O => p_2_in(8)
    );
\tmp_area[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(10),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(10),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(10),
      I5 => \o_area_reg[14]\(9),
      O => \tmp_area[11]_i_2_n_0\
    );
\tmp_area[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(9),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(9),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(9),
      I5 => \o_area_reg[14]\(8),
      O => \tmp_area[11]_i_3_n_0\
    );
\tmp_area[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(8),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(8),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(8),
      I5 => \o_area_reg[14]\(7),
      O => \tmp_area[11]_i_4_n_0\
    );
\tmp_area[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(7),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(7),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(7),
      I5 => \o_area_reg[14]\(6),
      O => \tmp_area[11]_i_5_n_0\
    );
\tmp_area[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[11]_i_2_n_0\,
      I1 => \o_area_reg[14]\(10),
      I2 => \tmp_area_reg[15]_0\(11),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(11),
      I5 => p_2_in(11),
      O => \tmp_area[11]_i_6_n_0\
    );
\tmp_area[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[11]_i_3_n_0\,
      I1 => \o_area_reg[14]\(9),
      I2 => \tmp_area_reg[15]_0\(10),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(10),
      I5 => p_2_in(10),
      O => \tmp_area[11]_i_7_n_0\
    );
\tmp_area[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[11]_i_4_n_0\,
      I1 => \o_area_reg[14]\(8),
      I2 => \tmp_area_reg[15]_0\(9),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(9),
      I5 => p_2_in(9),
      O => \tmp_area[11]_i_8_n_0\
    );
\tmp_area[11]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[11]_i_5_n_0\,
      I1 => \o_area_reg[14]\(7),
      I2 => \tmp_area_reg[15]_0\(8),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(8),
      I5 => p_2_in(8),
      O => \tmp_area[11]_i_9_n_0\
    );
\tmp_area[15]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[15]_i_6_n_0\,
      I1 => \o_area_reg[14]\(11),
      I2 => \tmp_area_reg[15]_0\(12),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(12),
      I5 => p_2_in(12),
      O => \tmp_area[15]_i_10_n_0\
    );
\tmp_area[15]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEFFFFFFF"
    )
        port map (
      I0 => \^state176_out\,
      I1 => state(3),
      I2 => state(2),
      I3 => o_end_reg_1,
      I4 => state(1),
      I5 => state(0),
      O => \tmp_area[15]_i_11_n_0\
    );
\tmp_area[15]_i_16\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \total_area_reg[15]\(14),
      I1 => \^state176_out\,
      I2 => \tmp_area_reg[15]_0\(14),
      O => \tmp_area[15]_i_16_n_0\
    );
\tmp_area[15]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"223CDD3C"
    )
        port map (
      I0 => \^out\(15),
      I1 => \o_area_reg[15]_0\,
      I2 => \tmp_area_reg[15]_0\(15),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(15),
      O => \tmp_area[15]_i_17_n_0\
    );
\tmp_area[15]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(14),
      O => p_2_in(14)
    );
\tmp_area[15]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(13),
      O => p_2_in(13)
    );
\tmp_area[15]_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(12),
      O => p_2_in(12)
    );
\tmp_area[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(13),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(13),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(13),
      I5 => \o_area_reg[14]\(12),
      O => \tmp_area[15]_i_4_n_0\
    );
\tmp_area[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(12),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(12),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(12),
      I5 => \o_area_reg[14]\(11),
      O => \tmp_area[15]_i_5_n_0\
    );
\tmp_area[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(11),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(11),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(11),
      I5 => \o_area_reg[14]\(10),
      O => \tmp_area[15]_i_6_n_0\
    );
\tmp_area[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7788718E77888E71"
    )
        port map (
      I0 => \o_area_reg[14]\(13),
      I1 => \tmp_area[15]_i_16_n_0\,
      I2 => \o_area_reg[15]\(14),
      I3 => \tmp_area[15]_i_17_n_0\,
      I4 => \tmp_area[15]_i_11_n_0\,
      I5 => \o_area_reg[15]\(15),
      O => \tmp_area[15]_i_7_n_0\
    );
\tmp_area[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[15]_i_4_n_0\,
      I1 => \o_area_reg[14]\(13),
      I2 => \tmp_area_reg[15]_0\(14),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(14),
      I5 => p_2_in(14),
      O => \tmp_area[15]_i_8_n_0\
    );
\tmp_area[15]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[15]_i_5_n_0\,
      I1 => \o_area_reg[14]\(12),
      I2 => \tmp_area_reg[15]_0\(13),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(13),
      I5 => p_2_in(13),
      O => \tmp_area[15]_i_9_n_0\
    );
\tmp_area[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7474777774777477"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^state176_out\,
      I2 => state174_out,
      I3 => \o_area_reg[0]\(0),
      I4 => \o_area_reg[0]_0\(0),
      I5 => state172_out,
      O => \p_1_in__0\(0)
    );
\tmp_area[3]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(3),
      O => p_2_in(3)
    );
\tmp_area[3]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(2),
      O => p_2_in(2)
    );
\tmp_area[3]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(1),
      O => p_2_in(1)
    );
\tmp_area[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(2),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(2),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(2),
      I5 => \o_area_reg[14]\(1),
      O => \tmp_area[3]_i_2_n_0\
    );
\tmp_area[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(1),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(1),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(1),
      I5 => \o_area_reg[14]\(0),
      O => \tmp_area[3]_i_3_n_0\
    );
\tmp_area[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFDDDD0DDD000"
    )
        port map (
      I0 => \o_area_reg[15]\(0),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(0),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(0),
      I5 => \p_1_in__0\(0),
      O => \tmp_area[3]_i_4_n_0\
    );
\tmp_area[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[3]_i_2_n_0\,
      I1 => \o_area_reg[14]\(2),
      I2 => \tmp_area_reg[15]_0\(3),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(3),
      I5 => p_2_in(3),
      O => \tmp_area[3]_i_5_n_0\
    );
\tmp_area[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[3]_i_3_n_0\,
      I1 => \o_area_reg[14]\(1),
      I2 => \tmp_area_reg[15]_0\(2),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(2),
      I5 => p_2_in(2),
      O => \tmp_area[3]_i_6_n_0\
    );
\tmp_area[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[3]_i_4_n_0\,
      I1 => \o_area_reg[14]\(0),
      I2 => \tmp_area_reg[15]_0\(1),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(1),
      I5 => p_2_in(1),
      O => \tmp_area[3]_i_7_n_0\
    );
\tmp_area[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D2DDD2222D222DDD"
    )
        port map (
      I0 => \o_area_reg[15]\(0),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(0),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(0),
      I5 => \p_1_in__0\(0),
      O => \tmp_area[3]_i_8_n_0\
    );
\tmp_area[4]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(7),
      I1 => \^out\(7),
      O => \tmp_area[4]_i_2__0_n_0\
    );
\tmp_area[4]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(6),
      I1 => \^out\(6),
      O => \tmp_area[4]_i_3__0_n_0\
    );
\tmp_area[4]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(5),
      I1 => \^out\(5),
      O => \tmp_area[4]_i_4__0_n_0\
    );
\tmp_area[4]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \width_reg[7]\(4),
      I1 => \^out\(4),
      O => \tmp_area[4]_i_5__0_n_0\
    );
\tmp_area[7]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(7),
      O => p_2_in(7)
    );
\tmp_area[7]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(6),
      O => p_2_in(6)
    );
\tmp_area[7]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(5),
      O => p_2_in(5)
    );
\tmp_area[7]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tmp_area[15]_i_11_n_0\,
      I1 => \o_area_reg[15]\(4),
      O => p_2_in(4)
    );
\tmp_area[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(6),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(6),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(6),
      I5 => \o_area_reg[14]\(5),
      O => \tmp_area[7]_i_2_n_0\
    );
\tmp_area[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(5),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(5),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(5),
      I5 => \o_area_reg[14]\(4),
      O => \tmp_area[7]_i_3_n_0\
    );
\tmp_area[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(4),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(4),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(4),
      I5 => \o_area_reg[14]\(3),
      O => \tmp_area[7]_i_4_n_0\
    );
\tmp_area[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FFF11110111000"
    )
        port map (
      I0 => \o_area_reg[15]\(3),
      I1 => \tmp_area[15]_i_11_n_0\,
      I2 => \total_area_reg[15]\(3),
      I3 => \^state176_out\,
      I4 => \tmp_area_reg[15]_0\(3),
      I5 => \o_area_reg[14]\(2),
      O => \tmp_area[7]_i_5_n_0\
    );
\tmp_area[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[7]_i_2_n_0\,
      I1 => \o_area_reg[14]\(6),
      I2 => \tmp_area_reg[15]_0\(7),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(7),
      I5 => p_2_in(7),
      O => \tmp_area[7]_i_6_n_0\
    );
\tmp_area[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[7]_i_3_n_0\,
      I1 => \o_area_reg[14]\(5),
      I2 => \tmp_area_reg[15]_0\(6),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(6),
      I5 => p_2_in(6),
      O => \tmp_area[7]_i_7_n_0\
    );
\tmp_area[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[7]_i_4_n_0\,
      I1 => \o_area_reg[14]\(4),
      I2 => \tmp_area_reg[15]_0\(5),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(5),
      I5 => p_2_in(5),
      O => \tmp_area[7]_i_8_n_0\
    );
\tmp_area[7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6669996999966696"
    )
        port map (
      I0 => \tmp_area[7]_i_5_n_0\,
      I1 => \o_area_reg[14]\(3),
      I2 => \tmp_area_reg[15]_0\(4),
      I3 => \^state176_out\,
      I4 => \total_area_reg[15]\(4),
      I5 => p_2_in(4),
      O => \tmp_area[7]_i_9_n_0\
    );
\tmp_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[0]_i_1_n_7\,
      Q => \^out\(0),
      R => i_rst_IBUF
    );
\tmp_area_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_area_reg[0]_i_1_n_0\,
      CO(2) => \tmp_area_reg[0]_i_1_n_1\,
      CO(1) => \tmp_area_reg[0]_i_1_n_2\,
      CO(0) => \tmp_area_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \width_reg[7]\(3 downto 0),
      O(3) => \tmp_area_reg[0]_i_1_n_4\,
      O(2) => \tmp_area_reg[0]_i_1_n_5\,
      O(1) => \tmp_area_reg[0]_i_1_n_6\,
      O(0) => \tmp_area_reg[0]_i_1_n_7\,
      S(3) => \tmp_area[0]_i_2_n_0\,
      S(2) => \tmp_area[0]_i_3__1_n_0\,
      S(1) => \tmp_area[0]_i_4__0_n_0\,
      S(0) => \tmp_area[0]_i_5__0_n_0\
    );
\tmp_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[8]_i_1__0_n_5\,
      Q => \^out\(10),
      R => i_rst_IBUF
    );
\tmp_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[8]_i_1__0_n_4\,
      Q => \^out\(11),
      R => i_rst_IBUF
    );
\tmp_area_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[7]_i_1_n_0\,
      CO(3) => \tmp_area_reg[11]_i_1_n_0\,
      CO(2) => \tmp_area_reg[11]_i_1_n_1\,
      CO(1) => \tmp_area_reg[11]_i_1_n_2\,
      CO(0) => \tmp_area_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_area[11]_i_2_n_0\,
      DI(2) => \tmp_area[11]_i_3_n_0\,
      DI(1) => \tmp_area[11]_i_4_n_0\,
      DI(0) => \tmp_area[11]_i_5_n_0\,
      O(3 downto 0) => D(11 downto 8),
      S(3) => \tmp_area[11]_i_6_n_0\,
      S(2) => \tmp_area[11]_i_7_n_0\,
      S(1) => \tmp_area[11]_i_8_n_0\,
      S(0) => \tmp_area[11]_i_9_n_0\
    );
\tmp_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[12]_i_1__0_n_7\,
      Q => \^out\(12),
      R => i_rst_IBUF
    );
\tmp_area_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[8]_i_1__0_n_0\,
      CO(3) => \NLW_tmp_area_reg[12]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \tmp_area_reg[12]_i_1__0_n_1\,
      CO(1) => \tmp_area_reg[12]_i_1__0_n_2\,
      CO(0) => \tmp_area_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[12]_i_1__0_n_4\,
      O(2) => \tmp_area_reg[12]_i_1__0_n_5\,
      O(1) => \tmp_area_reg[12]_i_1__0_n_6\,
      O(0) => \tmp_area_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => \^out\(15 downto 12)
    );
\tmp_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[12]_i_1__0_n_6\,
      Q => \^out\(13),
      R => i_rst_IBUF
    );
\tmp_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[12]_i_1__0_n_5\,
      Q => \^out\(14),
      R => i_rst_IBUF
    );
\tmp_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[12]_i_1__0_n_4\,
      Q => \^out\(15),
      R => i_rst_IBUF
    );
\tmp_area_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[11]_i_1_n_0\,
      CO(3) => \NLW_tmp_area_reg[15]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \tmp_area_reg[15]_i_2_n_1\,
      CO(1) => \tmp_area_reg[15]_i_2_n_2\,
      CO(0) => \tmp_area_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \tmp_area[15]_i_4_n_0\,
      DI(1) => \tmp_area[15]_i_5_n_0\,
      DI(0) => \tmp_area[15]_i_6_n_0\,
      O(3 downto 0) => D(15 downto 12),
      S(3) => \tmp_area[15]_i_7_n_0\,
      S(2) => \tmp_area[15]_i_8_n_0\,
      S(1) => \tmp_area[15]_i_9_n_0\,
      S(0) => \tmp_area[15]_i_10_n_0\
    );
\tmp_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[0]_i_1_n_6\,
      Q => \^out\(1),
      R => i_rst_IBUF
    );
\tmp_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[0]_i_1_n_5\,
      Q => \^out\(2),
      R => i_rst_IBUF
    );
\tmp_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[0]_i_1_n_4\,
      Q => \^out\(3),
      R => i_rst_IBUF
    );
\tmp_area_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_area_reg[3]_i_1_n_0\,
      CO(2) => \tmp_area_reg[3]_i_1_n_1\,
      CO(1) => \tmp_area_reg[3]_i_1_n_2\,
      CO(0) => \tmp_area_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_area[3]_i_2_n_0\,
      DI(2) => \tmp_area[3]_i_3_n_0\,
      DI(1) => \tmp_area[3]_i_4_n_0\,
      DI(0) => '0',
      O(3 downto 0) => D(3 downto 0),
      S(3) => \tmp_area[3]_i_5_n_0\,
      S(2) => \tmp_area[3]_i_6_n_0\,
      S(1) => \tmp_area[3]_i_7_n_0\,
      S(0) => \tmp_area[3]_i_8_n_0\
    );
\tmp_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[4]_i_1__0_n_7\,
      Q => \^out\(4),
      R => i_rst_IBUF
    );
\tmp_area_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[0]_i_1_n_0\,
      CO(3) => \tmp_area_reg[4]_i_1__0_n_0\,
      CO(2) => \tmp_area_reg[4]_i_1__0_n_1\,
      CO(1) => \tmp_area_reg[4]_i_1__0_n_2\,
      CO(0) => \tmp_area_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \width_reg[7]\(7 downto 4),
      O(3) => \tmp_area_reg[4]_i_1__0_n_4\,
      O(2) => \tmp_area_reg[4]_i_1__0_n_5\,
      O(1) => \tmp_area_reg[4]_i_1__0_n_6\,
      O(0) => \tmp_area_reg[4]_i_1__0_n_7\,
      S(3) => \tmp_area[4]_i_2__0_n_0\,
      S(2) => \tmp_area[4]_i_3__0_n_0\,
      S(1) => \tmp_area[4]_i_4__0_n_0\,
      S(0) => \tmp_area[4]_i_5__0_n_0\
    );
\tmp_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[4]_i_1__0_n_6\,
      Q => \^out\(5),
      R => i_rst_IBUF
    );
\tmp_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[4]_i_1__0_n_5\,
      Q => \^out\(6),
      R => i_rst_IBUF
    );
\tmp_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[4]_i_1__0_n_4\,
      Q => \^out\(7),
      R => i_rst_IBUF
    );
\tmp_area_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[3]_i_1_n_0\,
      CO(3) => \tmp_area_reg[7]_i_1_n_0\,
      CO(2) => \tmp_area_reg[7]_i_1_n_1\,
      CO(1) => \tmp_area_reg[7]_i_1_n_2\,
      CO(0) => \tmp_area_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_area[7]_i_2_n_0\,
      DI(2) => \tmp_area[7]_i_3_n_0\,
      DI(1) => \tmp_area[7]_i_4_n_0\,
      DI(0) => \tmp_area[7]_i_5_n_0\,
      O(3 downto 0) => D(7 downto 4),
      S(3) => \tmp_area[7]_i_6_n_0\,
      S(2) => \tmp_area[7]_i_7_n_0\,
      S(1) => \tmp_area[7]_i_8_n_0\,
      S(0) => \tmp_area[7]_i_9_n_0\
    );
\tmp_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[8]_i_1__0_n_7\,
      Q => \^out\(8),
      R => i_rst_IBUF
    );
\tmp_area_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_area_reg[4]_i_1__0_n_0\,
      CO(3) => \tmp_area_reg[8]_i_1__0_n_0\,
      CO(2) => \tmp_area_reg[8]_i_1__0_n_1\,
      CO(1) => \tmp_area_reg[8]_i_1__0_n_2\,
      CO(0) => \tmp_area_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tmp_area_reg[8]_i_1__0_n_4\,
      O(2) => \tmp_area_reg[8]_i_1__0_n_5\,
      O(1) => \tmp_area_reg[8]_i_1__0_n_6\,
      O(0) => \tmp_area_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => \^out\(11 downto 8)
    );
\tmp_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => x,
      D => \tmp_area_reg[8]_i_1__0_n_6\,
      Q => \^out\(9),
      R => i_rst_IBUF
    );
\x[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \x_reg__0\(0),
      O => \plusOp__1\(0)
    );
\x[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_reg__0\(0),
      I1 => \x_reg__0\(1),
      O => \plusOp__1\(1)
    );
\x[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \x_reg__0\(0),
      I1 => \x_reg__0\(1),
      I2 => \x_reg__0\(2),
      O => \plusOp__1\(2)
    );
\x[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \x_reg__0\(1),
      I1 => \x_reg__0\(0),
      I2 => \x_reg__0\(2),
      I3 => \x_reg__0\(3),
      O => \plusOp__1\(3)
    );
\x[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \x_reg__0\(2),
      I1 => \x_reg__0\(0),
      I2 => \x_reg__0\(1),
      I3 => \x_reg__0\(3),
      I4 => \x_reg__0\(4),
      O => \plusOp__1\(4)
    );
\x[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \x_reg__0\(3),
      I1 => \x_reg__0\(1),
      I2 => \x_reg__0\(0),
      I3 => \x_reg__0\(2),
      I4 => \x_reg__0\(4),
      I5 => \x_reg__0\(5),
      O => \plusOp__1\(5)
    );
\x[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x[7]_i_4_n_0\,
      I1 => \x_reg__0\(6),
      O => \plusOp__1\(6)
    );
\x[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAA8A"
    )
        port map (
      I0 => state19_out,
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      I4 => i_rst_IBUF,
      O => \x[7]_i_1_n_0\
    );
\x[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => \o_address[15]_i_3__1_n_0\,
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => \x[7]_i_2_n_0\
    );
\x[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \x[7]_i_4_n_0\,
      I1 => \x_reg__0\(6),
      I2 => \x_reg__0\(7),
      O => \plusOp__1\(7)
    );
\x[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \x_reg__0\(5),
      I1 => \x_reg__0\(3),
      I2 => \x_reg__0\(1),
      I3 => \x_reg__0\(0),
      I4 => \x_reg__0\(2),
      I5 => \x_reg__0\(4),
      O => \x[7]_i_4_n_0\
    );
\x_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(0),
      Q => \x_reg__0\(0),
      R => \x[7]_i_1_n_0\
    );
\x_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(1),
      Q => \x_reg__0\(1),
      R => \x[7]_i_1_n_0\
    );
\x_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(2),
      Q => \x_reg__0\(2),
      R => \x[7]_i_1_n_0\
    );
\x_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(3),
      Q => \x_reg__0\(3),
      R => \x[7]_i_1_n_0\
    );
\x_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(4),
      Q => \x_reg__0\(4),
      R => \x[7]_i_1_n_0\
    );
\x_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(5),
      Q => \x_reg__0\(5),
      R => \x[7]_i_1_n_0\
    );
\x_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(6),
      Q => \x_reg__0\(6),
      R => \x[7]_i_1_n_0\
    );
\x_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \x[7]_i_2_n_0\,
      D => \plusOp__1\(7),
      Q => \x_reg__0\(7),
      R => \x[7]_i_1_n_0\
    );
\y[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \y_reg__0\(0),
      O => \plusOp__0\(0)
    );
\y[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      O => \plusOp__0\(1)
    );
\y[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(2),
      O => \plusOp__0\(2)
    );
\y[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(3),
      O => \plusOp__0\(3)
    );
\y[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(3),
      I4 => \y_reg__0\(4),
      O => \plusOp__0\(4)
    );
\y[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \y_reg__0\(3),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(2),
      I4 => \y_reg__0\(4),
      I5 => \y_reg__0\(5),
      O => \plusOp__0\(5)
    );
\y[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y[7]_i_3_n_0\,
      I1 => \y_reg__0\(6),
      O => \plusOp__0\(6)
    );
\y[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA8A"
    )
        port map (
      I0 => state19_out,
      I1 => state_0(0),
      I2 => start_top,
      I3 => state_0(1),
      O => x
    );
\y[7]_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \y[7]_i_3_n_0\,
      I1 => \y_reg__0\(6),
      I2 => \y_reg__0\(7),
      O => \plusOp__0\(7)
    );
\y[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(1),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(2),
      I5 => \y_reg__0\(4),
      O => \y[7]_i_3_n_0\
    );
\y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(0),
      Q => \y_reg__0\(0),
      R => i_rst_IBUF
    );
\y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(1),
      Q => \y_reg__0\(1),
      R => i_rst_IBUF
    );
\y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(2),
      Q => \y_reg__0\(2),
      R => i_rst_IBUF
    );
\y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(3),
      Q => \y_reg__0\(3),
      R => i_rst_IBUF
    );
\y_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(4),
      Q => \y_reg__0\(4),
      R => i_rst_IBUF
    );
\y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(5),
      Q => \y_reg__0\(5),
      R => i_rst_IBUF
    );
\y_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(6),
      Q => \y_reg__0\(6),
      R => i_rst_IBUF
    );
\y_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => x,
      D => \plusOp__0\(7),
      Q => \y_reg__0\(7),
      R => i_rst_IBUF
    );
\zero0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \width_reg[7]\(6),
      I1 => \^out\(6),
      O => \tmp_address_reg[7]_0\(3)
    );
\zero0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \width_reg[7]\(5),
      I1 => \^out\(5),
      O => \tmp_address_reg[7]_0\(2)
    );
\zero0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \width_reg[7]\(4),
      I1 => \^out\(4),
      O => \tmp_address_reg[7]_0\(1)
    );
\zero0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \width_reg[7]\(3),
      I1 => \^out\(3),
      O => \tmp_address_reg[7]_0\(0)
    );
\zero0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^out\(6),
      I1 => \width_reg[7]\(6),
      I2 => \width_reg[7]\(7),
      I3 => \^out\(7),
      O => \tmp_address_reg[7]_1\(3)
    );
\zero0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^out\(5),
      I1 => \width_reg[7]\(5),
      I2 => \width_reg[7]\(6),
      I3 => \^out\(6),
      O => \tmp_address_reg[7]_1\(2)
    );
\zero0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^out\(4),
      I1 => \width_reg[7]\(4),
      I2 => \width_reg[7]\(5),
      I3 => \^out\(5),
      O => \tmp_address_reg[7]_1\(1)
    );
\zero0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \^out\(3),
      I1 => \width_reg[7]\(3),
      I2 => \width_reg[7]\(4),
      I3 => \^out\(4),
      O => \tmp_address_reg[7]_1\(0)
    );
\zero0_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^out\(7),
      I1 => \width_reg[7]\(7),
      I2 => \^out\(8),
      O => \tmp_address_reg[11]_0\(0)
    );
zero0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^out\(2),
      O => \tmp_address_reg[4]_0\(0)
    );
\zero0_carry_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \width_reg[7]\(2),
      I1 => \width_reg[7]\(3),
      I2 => \^out\(3),
      O => \tmp_address_reg[3]_0\(3)
    );
zero0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \width_reg[7]\(2),
      I1 => \^out\(2),
      O => \tmp_address_reg[3]_0\(2)
    );
zero0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^out\(1),
      I1 => \width_reg[7]\(1),
      O => \tmp_address_reg[3]_0\(1)
    );
zero0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^out\(0),
      I1 => \width_reg[7]\(0),
      O => \tmp_address_reg[3]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity project_reti_logiche is
  port (
    i_clk : in STD_LOGIC;
    i_start : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_address : out STD_LOGIC_VECTOR ( 15 downto 0 );
    o_done : out STD_LOGIC;
    o_en : out STD_LOGIC;
    o_we : out STD_LOGIC;
    o_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of project_reti_logiche : entity is true;
end project_reti_logiche;

architecture STRUCTURE of project_reti_logiche is
  signal bot_address : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal bot_n_0 : STD_LOGIC;
  signal bot_n_1 : STD_LOGIC;
  signal bot_n_10 : STD_LOGIC;
  signal bot_n_11 : STD_LOGIC;
  signal bot_n_12 : STD_LOGIC;
  signal bot_n_13 : STD_LOGIC;
  signal bot_n_14 : STD_LOGIC;
  signal bot_n_15 : STD_LOGIC;
  signal bot_n_16 : STD_LOGIC;
  signal bot_n_17 : STD_LOGIC;
  signal bot_n_18 : STD_LOGIC;
  signal bot_n_19 : STD_LOGIC;
  signal bot_n_20 : STD_LOGIC;
  signal bot_n_28 : STD_LOGIC;
  signal bot_n_29 : STD_LOGIC;
  signal bot_n_3 : STD_LOGIC;
  signal bot_n_30 : STD_LOGIC;
  signal bot_n_31 : STD_LOGIC;
  signal bot_n_4 : STD_LOGIC;
  signal bot_n_48 : STD_LOGIC;
  signal bot_n_49 : STD_LOGIC;
  signal bot_n_5 : STD_LOGIC;
  signal bot_n_50 : STD_LOGIC;
  signal bot_n_51 : STD_LOGIC;
  signal bot_n_52 : STD_LOGIC;
  signal bot_n_53 : STD_LOGIC;
  signal bot_n_54 : STD_LOGIC;
  signal bot_n_55 : STD_LOGIC;
  signal bot_n_56 : STD_LOGIC;
  signal bot_n_57 : STD_LOGIC;
  signal bot_n_58 : STD_LOGIC;
  signal bot_n_59 : STD_LOGIC;
  signal bot_n_6 : STD_LOGIC;
  signal bot_n_60 : STD_LOGIC;
  signal bot_n_61 : STD_LOGIC;
  signal bot_n_62 : STD_LOGIC;
  signal bot_n_63 : STD_LOGIC;
  signal bot_n_7 : STD_LOGIC;
  signal bot_n_8 : STD_LOGIC;
  signal bot_n_9 : STD_LOGIC;
  signal height : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \height[7]_i_1_n_0\ : STD_LOGIC;
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_data_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_rst_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal lft_address : STD_LOGIC_VECTOR ( 15 downto 3 );
  signal lft_n_0 : STD_LOGIC;
  signal lft_n_15 : STD_LOGIC;
  signal lft_n_16 : STD_LOGIC;
  signal lft_n_31 : STD_LOGIC;
  signal lft_n_32 : STD_LOGIC;
  signal lft_n_33 : STD_LOGIC;
  signal lft_n_34 : STD_LOGIC;
  signal lft_n_35 : STD_LOGIC;
  signal lft_n_36 : STD_LOGIC;
  signal lft_n_37 : STD_LOGIC;
  signal lft_n_38 : STD_LOGIC;
  signal lft_n_39 : STD_LOGIC;
  signal lft_n_40 : STD_LOGIC;
  signal lft_n_41 : STD_LOGIC;
  signal multiplied : STD_LOGIC;
  signal multiply : STD_LOGIC;
  signal multiply_i_1_n_0 : STD_LOGIC;
  signal \o_address[2]_i_10_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_14_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_3_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_7_n_0\ : STD_LOGIC;
  signal \o_address[2]_i_8_n_0\ : STD_LOGIC;
  signal o_address_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \o_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \o_data[7]_i_3_n_0\ : STD_LOGIC;
  signal \o_data[7]_i_4_n_0\ : STD_LOGIC;
  signal \o_data[7]_i_5_n_0\ : STD_LOGIC;
  signal \o_data[7]_i_7_n_0\ : STD_LOGIC;
  signal o_data_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_done_OBUF : STD_LOGIC;
  signal o_done_i_2_n_0 : STD_LOGIC;
  signal o_en_OBUF : STD_LOGIC;
  signal o_end2 : STD_LOGIC;
  signal o_we_OBUF : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \p_1_in__0\ : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal \p_1_in__1\ : STD_LOGIC;
  signal p_51_in : STD_LOGIC;
  signal rgt_address : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rgt_n_0 : STD_LOGIC;
  signal rgt_n_1 : STD_LOGIC;
  signal rgt_n_10 : STD_LOGIC;
  signal rgt_n_11 : STD_LOGIC;
  signal rgt_n_12 : STD_LOGIC;
  signal rgt_n_13 : STD_LOGIC;
  signal rgt_n_14 : STD_LOGIC;
  signal rgt_n_15 : STD_LOGIC;
  signal rgt_n_16 : STD_LOGIC;
  signal rgt_n_17 : STD_LOGIC;
  signal rgt_n_18 : STD_LOGIC;
  signal rgt_n_19 : STD_LOGIC;
  signal rgt_n_2 : STD_LOGIC;
  signal rgt_n_20 : STD_LOGIC;
  signal rgt_n_21 : STD_LOGIC;
  signal rgt_n_22 : STD_LOGIC;
  signal rgt_n_23 : STD_LOGIC;
  signal rgt_n_24 : STD_LOGIC;
  signal rgt_n_26 : STD_LOGIC;
  signal rgt_n_27 : STD_LOGIC;
  signal rgt_n_28 : STD_LOGIC;
  signal rgt_n_29 : STD_LOGIC;
  signal rgt_n_3 : STD_LOGIC;
  signal rgt_n_30 : STD_LOGIC;
  signal rgt_n_31 : STD_LOGIC;
  signal rgt_n_32 : STD_LOGIC;
  signal rgt_n_33 : STD_LOGIC;
  signal rgt_n_34 : STD_LOGIC;
  signal rgt_n_35 : STD_LOGIC;
  signal rgt_n_36 : STD_LOGIC;
  signal rgt_n_37 : STD_LOGIC;
  signal rgt_n_38 : STD_LOGIC;
  signal rgt_n_39 : STD_LOGIC;
  signal rgt_n_4 : STD_LOGIC;
  signal rgt_n_40 : STD_LOGIC;
  signal rgt_n_41 : STD_LOGIC;
  signal rgt_n_5 : STD_LOGIC;
  signal rgt_n_9 : STD_LOGIC;
  signal start_bot : STD_LOGIC;
  signal start_lft : STD_LOGIC;
  signal start_rgt : STD_LOGIC;
  signal start_top : STD_LOGIC;
  signal start_top_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal state1 : STD_LOGIC;
  signal state172_out : STD_LOGIC;
  signal state174_out : STD_LOGIC;
  signal state176_out : STD_LOGIC;
  signal state180_out : STD_LOGIC;
  signal \state[0]_i_3_n_0\ : STD_LOGIC;
  signal \state[0]_i_5_n_0\ : STD_LOGIC;
  signal \state[0]_i_7_n_0\ : STD_LOGIC;
  signal \state[2]_i_4_n_0\ : STD_LOGIC;
  signal threshold : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \threshold[7]_i_1_n_0\ : STD_LOGIC;
  signal \tmp_address_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal tmp_area : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tmp_area_reg__0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal top_n_1 : STD_LOGIC;
  signal top_n_10 : STD_LOGIC;
  signal top_n_11 : STD_LOGIC;
  signal top_n_12 : STD_LOGIC;
  signal top_n_13 : STD_LOGIC;
  signal top_n_14 : STD_LOGIC;
  signal top_n_15 : STD_LOGIC;
  signal top_n_16 : STD_LOGIC;
  signal top_n_17 : STD_LOGIC;
  signal top_n_18 : STD_LOGIC;
  signal top_n_2 : STD_LOGIC;
  signal top_n_21 : STD_LOGIC;
  signal top_n_3 : STD_LOGIC;
  signal top_n_38 : STD_LOGIC;
  signal top_n_39 : STD_LOGIC;
  signal top_n_4 : STD_LOGIC;
  signal top_n_40 : STD_LOGIC;
  signal top_n_41 : STD_LOGIC;
  signal top_n_42 : STD_LOGIC;
  signal top_n_43 : STD_LOGIC;
  signal top_n_44 : STD_LOGIC;
  signal top_n_45 : STD_LOGIC;
  signal top_n_46 : STD_LOGIC;
  signal top_n_47 : STD_LOGIC;
  signal top_n_48 : STD_LOGIC;
  signal top_n_49 : STD_LOGIC;
  signal top_n_5 : STD_LOGIC;
  signal top_n_50 : STD_LOGIC;
  signal top_n_51 : STD_LOGIC;
  signal top_n_52 : STD_LOGIC;
  signal top_n_53 : STD_LOGIC;
  signal top_n_54 : STD_LOGIC;
  signal top_n_55 : STD_LOGIC;
  signal top_n_56 : STD_LOGIC;
  signal top_n_57 : STD_LOGIC;
  signal top_n_58 : STD_LOGIC;
  signal top_n_59 : STD_LOGIC;
  signal top_n_6 : STD_LOGIC;
  signal top_n_60 : STD_LOGIC;
  signal top_n_61 : STD_LOGIC;
  signal top_n_62 : STD_LOGIC;
  signal top_n_63 : STD_LOGIC;
  signal top_n_64 : STD_LOGIC;
  signal top_n_65 : STD_LOGIC;
  signal top_n_66 : STD_LOGIC;
  signal top_n_67 : STD_LOGIC;
  signal top_n_68 : STD_LOGIC;
  signal top_n_69 : STD_LOGIC;
  signal top_n_7 : STD_LOGIC;
  signal top_n_70 : STD_LOGIC;
  signal top_n_71 : STD_LOGIC;
  signal top_n_72 : STD_LOGIC;
  signal top_n_73 : STD_LOGIC;
  signal top_n_74 : STD_LOGIC;
  signal top_n_75 : STD_LOGIC;
  signal top_n_8 : STD_LOGIC;
  signal top_n_9 : STD_LOGIC;
  signal total_area : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal total_area0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \total_area[10]_i_10_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_11_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_12_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_13_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_14_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_2_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_3_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_8_n_0\ : STD_LOGIC;
  signal \total_area[10]_i_9_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_10_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_11_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_12_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_13_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_16_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_17_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_18_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_19_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_20_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_21_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_22_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_23_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_24_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_25_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_26_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_27_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_28_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_29_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_2_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_30_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_31_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_32_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_33_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_34_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_35_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_36_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_3_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_8_n_0\ : STD_LOGIC;
  signal \total_area[14]_i_9_n_0\ : STD_LOGIC;
  signal \total_area[15]_i_2_n_0\ : STD_LOGIC;
  signal \total_area[15]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[15]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[15]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[15]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_2_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_3_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_8_n_0\ : STD_LOGIC;
  signal \total_area[2]_i_9_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_10_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_3_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_8_n_0\ : STD_LOGIC;
  signal \total_area[3]_i_9_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_10_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_11_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_12_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_13_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_14_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_15_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_16_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_17_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_18_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_19_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_2_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_4_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_5_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_6_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_7_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_8_n_0\ : STD_LOGIC;
  signal \total_area[6]_i_9_n_0\ : STD_LOGIC;
  signal \total_area_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \total_area_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \total_area_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \total_area_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_0\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_1\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_2\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_3\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_4\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_5\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_6\ : STD_LOGIC;
  signal \total_area_reg[14]_i_14_n_7\ : STD_LOGIC;
  signal \total_area_reg[14]_i_15_n_1\ : STD_LOGIC;
  signal \total_area_reg[14]_i_15_n_3\ : STD_LOGIC;
  signal \total_area_reg[14]_i_15_n_6\ : STD_LOGIC;
  signal \total_area_reg[14]_i_15_n_7\ : STD_LOGIC;
  signal \total_area_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \total_area_reg[14]_i_1_n_1\ : STD_LOGIC;
  signal \total_area_reg[14]_i_1_n_2\ : STD_LOGIC;
  signal \total_area_reg[14]_i_1_n_3\ : STD_LOGIC;
  signal \total_area_reg[15]_i_3_n_1\ : STD_LOGIC;
  signal \total_area_reg[15]_i_3_n_3\ : STD_LOGIC;
  signal \total_area_reg[15]_i_3_n_6\ : STD_LOGIC;
  signal \total_area_reg[15]_i_3_n_7\ : STD_LOGIC;
  signal \total_area_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \total_area_reg[2]_i_1_n_1\ : STD_LOGIC;
  signal \total_area_reg[2]_i_1_n_2\ : STD_LOGIC;
  signal \total_area_reg[2]_i_1_n_3\ : STD_LOGIC;
  signal \total_area_reg[2]_i_1_n_4\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_4\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_5\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_6\ : STD_LOGIC;
  signal \total_area_reg[3]_i_2_n_7\ : STD_LOGIC;
  signal \total_area_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \total_area_reg[6]_i_1_n_1\ : STD_LOGIC;
  signal \total_area_reg[6]_i_1_n_2\ : STD_LOGIC;
  signal \total_area_reg[6]_i_1_n_3\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_1\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_2\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_3\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_4\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_5\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_6\ : STD_LOGIC;
  signal \total_area_reg[6]_i_3_n_7\ : STD_LOGIC;
  signal width : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \width[7]_i_1_n_0\ : STD_LOGIC;
  signal y_bot : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal y_top : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_total_area_reg[14]_i_15_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_total_area_reg[14]_i_15_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_total_area_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_total_area_reg[15]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_total_area_reg[15]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_total_area_reg[15]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_total_area_reg[6]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_address[2]_i_10\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \o_address[2]_i_14\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \o_address[2]_i_3\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \o_address[2]_i_7\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \o_address[2]_i_8\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \o_data[7]_i_5\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \o_data[7]_i_6\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \o_data[7]_i_7\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of o_done_i_2 : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of start_top_i_1 : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \state[0]_i_3\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \state[0]_i_5\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \state[2]_i_3\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \state[2]_i_4\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \total_area[10]_i_10\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \total_area[10]_i_11\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \total_area[10]_i_12\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \total_area[10]_i_13\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \total_area[10]_i_14\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \total_area[14]_i_10\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \total_area[14]_i_12\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \total_area[14]_i_16\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \total_area[14]_i_17\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \total_area[14]_i_18\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \total_area[14]_i_19\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \total_area[14]_i_20\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \total_area[14]_i_33\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \total_area[14]_i_34\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \total_area[14]_i_35\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \total_area[14]_i_36\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \total_area[2]_i_9\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \total_area[3]_i_10\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \total_area[6]_i_16\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \total_area[6]_i_17\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \total_area[6]_i_18\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \total_area[6]_i_19\ : label is "soft_lutpair71";
begin
bot: entity work.comp_bot
     port map (
      CO(0) => o_end2,
      D(7 downto 0) => i_data_IBUF(7 downto 0),
      DI(3) => bot_n_9,
      DI(2) => bot_n_10,
      DI(1) => bot_n_11,
      DI(0) => bot_n_12,
      E(0) => bot_n_5,
      Q(7 downto 0) => width(7 downto 0),
      S(3) => bot_n_13,
      S(2) => bot_n_14,
      S(1) => bot_n_15,
      S(0) => bot_n_16,
      \height_reg[7]\(7 downto 0) => height(7 downto 0),
      i_clk => \tmp_address_reg[0]_i_3_n_0\,
      i_clk_IBUF_BUFG => i_clk_IBUF_BUFG,
      i_rst_IBUF => i_rst_IBUF,
      i_start_IBUF => i_start_IBUF,
      \o_address_reg[15]_0\(15 downto 0) => bot_address(15 downto 0),
      \o_address_reg[3]_0\ => bot_n_1,
      \o_address_reg[3]_1\ => bot_n_3,
      o_done_reg => bot_n_8,
      o_en_reg => bot_n_7,
      o_end_reg_0 => bot_n_0,
      o_end_reg_1 => rgt_n_0,
      o_we_reg => bot_n_6,
      \o_y_reg[7]_0\(7 downto 0) => y_top(7 downto 0),
      \real_height_reg[3]\(3) => bot_n_17,
      \real_height_reg[3]\(2) => bot_n_18,
      \real_height_reg[3]\(1) => bot_n_19,
      \real_height_reg[3]\(0) => bot_n_20,
      \real_height_reg[7]\(6 downto 0) => y_bot(6 downto 0),
      \real_height_reg[7]_0\(3) => bot_n_28,
      \real_height_reg[7]_0\(2) => bot_n_29,
      \real_height_reg[7]_0\(1) => bot_n_30,
      \real_height_reg[7]_0\(0) => bot_n_31,
      start_bot => start_bot,
      state(3 downto 0) => state(3 downto 0),
      state172_out => state172_out,
      state174_out => state174_out,
      state176_out => state176_out,
      state180_out => state180_out,
      \state_reg[0]_0\ => bot_n_4,
      \state_reg[0]_1\ => \o_address[2]_i_3_n_0\,
      \state_reg[0]_2\ => \o_address[2]_i_7_n_0\,
      \state_reg[1]_0\ => \o_data[7]_i_4_n_0\,
      \state_reg[2]\ => \o_address[2]_i_8_n_0\,
      \threshold_reg[7]\(7 downto 0) => threshold(7 downto 0),
      \tmp_area_reg[15]_0\(15) => bot_n_48,
      \tmp_area_reg[15]_0\(14) => bot_n_49,
      \tmp_area_reg[15]_0\(13) => bot_n_50,
      \tmp_area_reg[15]_0\(12) => bot_n_51,
      \tmp_area_reg[15]_0\(11) => bot_n_52,
      \tmp_area_reg[15]_0\(10) => bot_n_53,
      \tmp_area_reg[15]_0\(9) => bot_n_54,
      \tmp_area_reg[15]_0\(8) => bot_n_55,
      \tmp_area_reg[15]_0\(7) => bot_n_56,
      \tmp_area_reg[15]_0\(6) => bot_n_57,
      \tmp_area_reg[15]_0\(5) => bot_n_58,
      \tmp_area_reg[15]_0\(4) => bot_n_59,
      \tmp_area_reg[15]_0\(3) => bot_n_60,
      \tmp_area_reg[15]_0\(2) => bot_n_61,
      \tmp_area_reg[15]_0\(1) => bot_n_62,
      \tmp_area_reg[15]_0\(0) => bot_n_63,
      \total_area_reg[15]\(15 downto 0) => total_area(15 downto 0)
    );
\height[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      O => \height[7]_i_1_n_0\
    );
\height_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(0),
      Q => height(0),
      R => i_rst_IBUF
    );
\height_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(1),
      Q => height(1),
      R => i_rst_IBUF
    );
\height_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(2),
      Q => height(2),
      R => i_rst_IBUF
    );
\height_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(3),
      Q => height(3),
      R => i_rst_IBUF
    );
\height_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(4),
      Q => height(4),
      R => i_rst_IBUF
    );
\height_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(5),
      Q => height(5),
      R => i_rst_IBUF
    );
\height_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(6),
      Q => height(6),
      R => i_rst_IBUF
    );
\height_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \height[7]_i_1_n_0\,
      D => i_data_IBUF(7),
      Q => height(7),
      R => i_rst_IBUF
    );
i_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clk_IBUF,
      O => i_clk_IBUF_BUFG
    );
i_clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_clk,
      O => i_clk_IBUF
    );
\i_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(0),
      O => i_data_IBUF(0)
    );
\i_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(1),
      O => i_data_IBUF(1)
    );
\i_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(2),
      O => i_data_IBUF(2)
    );
\i_data_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(3),
      O => i_data_IBUF(3)
    );
\i_data_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(4),
      O => i_data_IBUF(4)
    );
\i_data_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(5),
      O => i_data_IBUF(5)
    );
\i_data_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(6),
      O => i_data_IBUF(6)
    );
\i_data_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(7),
      O => i_data_IBUF(7)
    );
i_rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_rst,
      O => i_rst_IBUF
    );
i_start_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_start,
      O => i_start_IBUF
    );
lft: entity work.comp_lft
     port map (
      CO(0) => o_end2,
      D(7) => lft_n_34,
      D(6) => lft_n_35,
      D(5) => lft_n_36,
      D(4) => lft_n_37,
      D(3) => lft_n_38,
      D(2) => lft_n_39,
      D(1) => lft_n_40,
      D(0) => lft_n_41,
      I61(6 downto 0) => y_bot(6 downto 0),
      Q(12 downto 0) => lft_address(15 downto 3),
      S(0) => top_n_48,
      i_clk => \tmp_address_reg[0]_i_3_n_0\,
      i_clk_IBUF_BUFG => i_clk_IBUF_BUFG,
      i_rst_IBUF => i_rst_IBUF,
      \o_address_reg[0]\ => lft_n_0,
      \o_address_reg[0]_0\ => top_n_2,
      \o_address_reg[1]\ => lft_n_15,
      \o_address_reg[1]_0\ => top_n_3,
      \o_address_reg[2]\ => lft_n_16,
      \o_address_reg[2]_0\ => top_n_4,
      \o_address_reg[3]\ => lft_n_31,
      \o_area_reg[15]_0\(14) => rgt_n_26,
      \o_area_reg[15]_0\(13) => rgt_n_27,
      \o_area_reg[15]_0\(12) => rgt_n_28,
      \o_area_reg[15]_0\(11) => rgt_n_29,
      \o_area_reg[15]_0\(10) => rgt_n_30,
      \o_area_reg[15]_0\(9) => rgt_n_31,
      \o_area_reg[15]_0\(8) => rgt_n_32,
      \o_area_reg[15]_0\(7) => rgt_n_33,
      \o_area_reg[15]_0\(6) => rgt_n_34,
      \o_area_reg[15]_0\(5) => rgt_n_35,
      \o_area_reg[15]_0\(4) => rgt_n_36,
      \o_area_reg[15]_0\(3) => rgt_n_37,
      \o_area_reg[15]_0\(2) => rgt_n_38,
      \o_area_reg[15]_0\(1) => rgt_n_39,
      \o_area_reg[15]_0\(0) => rgt_n_40,
      \o_y_reg[3]\(3) => bot_n_17,
      \o_y_reg[3]\(2) => bot_n_18,
      \o_y_reg[3]\(1) => bot_n_19,
      \o_y_reg[3]\(0) => bot_n_20,
      \o_y_reg[7]\(3) => bot_n_28,
      \o_y_reg[7]\(2) => bot_n_29,
      \o_y_reg[7]\(1) => bot_n_30,
      \o_y_reg[7]\(0) => bot_n_31,
      \out\(15 downto 0) => \tmp_area_reg__0\(15 downto 0),
      \p_1_in__0\(13 downto 0) => \p_1_in__0\(14 downto 1),
      start_lft => start_lft,
      state(3 downto 0) => state(3 downto 0),
      state172_out => state172_out,
      state174_out => state174_out,
      state176_out => state176_out,
      \state_reg[0]_0\ => bot_n_8,
      \state_reg[2]\ => \o_address[2]_i_10_n_0\,
      \tmp_address_reg[2]_0\(2 downto 0) => rgt_address(2 downto 0),
      \tmp_area_reg[15]_0\ => lft_n_32,
      \tmp_area_reg[3]_0\(0) => lft_n_33,
      \width_reg[7]\(7 downto 0) => width(7 downto 0)
    );
multiplied_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => '1',
      Q => multiplied,
      R => '0'
    );
multiply_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAABA"
    )
        port map (
      I0 => multiply,
      I1 => \o_data[7]_i_4_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => multiply_i_1_n_0
    );
multiply_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => multiply_i_1_n_0,
      Q => multiply,
      R => '0'
    );
\o_address[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => \o_address[2]_i_10_n_0\
    );
\o_address[2]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(1),
      I3 => state(0),
      O => \o_address[2]_i_14_n_0\
    );
\o_address[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"07C7"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      O => \o_address[2]_i_3_n_0\
    );
\o_address[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0028"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      O => \o_address[2]_i_7_n_0\
    );
\o_address[2]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      O => \o_address[2]_i_8_n_0\
    );
\o_address_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(0),
      O => o_address(0)
    );
\o_address_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(10),
      O => o_address(10)
    );
\o_address_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(11),
      O => o_address(11)
    );
\o_address_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(12),
      O => o_address(12)
    );
\o_address_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(13),
      O => o_address(13)
    );
\o_address_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(14),
      O => o_address(14)
    );
\o_address_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(15),
      O => o_address(15)
    );
\o_address_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(1),
      O => o_address(1)
    );
\o_address_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(2),
      O => o_address(2)
    );
\o_address_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(3),
      O => o_address(3)
    );
\o_address_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(4),
      O => o_address(4)
    );
\o_address_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(5),
      O => o_address(5)
    );
\o_address_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(6),
      O => o_address(6)
    );
\o_address_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(7),
      O => o_address(7)
    );
\o_address_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(8),
      O => o_address(8)
    );
\o_address_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_address_OBUF(9),
      O => o_address(9)
    );
\o_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_5,
      Q => o_address_OBUF(0),
      R => '0'
    );
\o_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_18,
      Q => o_address_OBUF(10),
      R => rgt_n_1
    );
\o_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_19,
      Q => o_address_OBUF(11),
      R => rgt_n_1
    );
\o_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_20,
      Q => o_address_OBUF(12),
      R => rgt_n_1
    );
\o_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_21,
      Q => o_address_OBUF(13),
      R => rgt_n_1
    );
\o_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_22,
      Q => o_address_OBUF(14),
      R => rgt_n_1
    );
\o_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_23,
      Q => o_address_OBUF(15),
      R => rgt_n_1
    );
\o_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_9,
      Q => o_address_OBUF(1),
      R => '0'
    );
\o_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_10,
      Q => o_address_OBUF(2),
      R => '0'
    );
\o_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_11,
      Q => o_address_OBUF(3),
      R => rgt_n_1
    );
\o_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_12,
      Q => o_address_OBUF(4),
      R => rgt_n_1
    );
\o_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_13,
      Q => o_address_OBUF(5),
      R => rgt_n_1
    );
\o_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_14,
      Q => o_address_OBUF(6),
      R => rgt_n_1
    );
\o_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_15,
      Q => o_address_OBUF(7),
      R => rgt_n_1
    );
\o_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_16,
      Q => o_address_OBUF(8),
      R => rgt_n_1
    );
\o_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_1,
      D => rgt_n_17,
      Q => o_address_OBUF(9),
      R => rgt_n_1
    );
\o_data[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(0),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(8),
      O => \o_data[0]_i_1_n_0\
    );
\o_data[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(1),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(9),
      O => \o_data[1]_i_1_n_0\
    );
\o_data[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(2),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(10),
      O => \o_data[2]_i_1_n_0\
    );
\o_data[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(3),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(11),
      O => \o_data[3]_i_1_n_0\
    );
\o_data[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(4),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(12),
      O => \o_data[4]_i_1_n_0\
    );
\o_data[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(5),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(13),
      O => \o_data[5]_i_1_n_0\
    );
\o_data[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(6),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(14),
      O => \o_data[6]_i_1_n_0\
    );
\o_data[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => tmp_area(7),
      I1 => state(0),
      I2 => state(1),
      I3 => state(3),
      I4 => state(2),
      I5 => tmp_area(15),
      O => \o_data[7]_i_3_n_0\
    );
\o_data[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => state(3),
      I4 => i_start_IBUF,
      I5 => i_rst_IBUF,
      O => \o_data[7]_i_4_n_0\
    );
\o_data[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF9"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(3),
      I3 => state(2),
      O => \o_data[7]_i_5_n_0\
    );
\o_data[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => p_1_in
    );
\o_data[7]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => \o_data[7]_i_7_n_0\
    );
\o_data_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(0),
      O => o_data(0)
    );
\o_data_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(1),
      O => o_data(1)
    );
\o_data_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(2),
      O => o_data(2)
    );
\o_data_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(3),
      O => o_data(3)
    );
\o_data_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(4),
      O => o_data(4)
    );
\o_data_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(5),
      O => o_data(5)
    );
\o_data_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(6),
      O => o_data(6)
    );
\o_data_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(7),
      O => o_data(7)
    );
\o_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[0]_i_1_n_0\,
      Q => o_data_OBUF(0),
      R => top_n_41
    );
\o_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[1]_i_1_n_0\,
      Q => o_data_OBUF(1),
      R => top_n_41
    );
\o_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[2]_i_1_n_0\,
      Q => o_data_OBUF(2),
      R => top_n_41
    );
\o_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[3]_i_1_n_0\,
      Q => o_data_OBUF(3),
      R => top_n_41
    );
\o_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[4]_i_1_n_0\,
      Q => o_data_OBUF(4),
      R => top_n_41
    );
\o_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[5]_i_1_n_0\,
      Q => o_data_OBUF(5),
      R => top_n_41
    );
\o_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[6]_i_1_n_0\,
      Q => o_data_OBUF(6),
      R => top_n_41
    );
\o_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => rgt_n_24,
      D => \o_data[7]_i_3_n_0\,
      Q => o_data_OBUF(7),
      R => top_n_41
    );
o_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_done_OBUF,
      O => o_done
    );
o_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(3),
      I3 => state(2),
      O => o_done_i_2_n_0
    );
o_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => top_n_40,
      D => o_done_i_2_n_0,
      Q => o_done_OBUF,
      R => i_rst_IBUF
    );
o_en_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_en_OBUF,
      O => o_en
    );
o_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_7,
      D => top_n_43,
      Q => o_en_OBUF,
      R => i_rst_IBUF
    );
o_we_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_we_OBUF,
      O => o_we
    );
o_we_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_6,
      D => top_n_42,
      Q => o_we_OBUF,
      R => i_rst_IBUF
    );
rgt: entity work.comp_rgt
     port map (
      CO(0) => o_end2,
      D(7) => lft_n_34,
      D(6) => lft_n_35,
      D(5) => lft_n_36,
      D(4) => lft_n_37,
      D(3) => lft_n_38,
      D(2) => lft_n_39,
      D(1) => lft_n_40,
      D(0) => lft_n_41,
      DI(3) => top_n_44,
      DI(2) => top_n_45,
      DI(1) => top_n_46,
      DI(0) => top_n_47,
      E(0) => rgt_n_24,
      Q(7 downto 0) => width(7 downto 0),
      S(3) => top_n_66,
      S(2) => top_n_67,
      S(1) => top_n_68,
      S(0) => top_n_69,
      i_clk => \tmp_address_reg[0]_i_3_n_0\,
      i_clk_IBUF_BUFG => i_clk_IBUF_BUFG,
      i_rst_IBUF => i_rst_IBUF,
      multiplied_reg => top_n_38,
      \o_address_reg[0]\ => rgt_n_5,
      \o_address_reg[10]\ => rgt_n_18,
      \o_address_reg[11]\ => rgt_n_19,
      \o_address_reg[12]\ => rgt_n_20,
      \o_address_reg[13]\ => rgt_n_21,
      \o_address_reg[14]\ => rgt_n_22,
      \o_address_reg[15]\ => rgt_n_23,
      \o_address_reg[1]\ => rgt_n_9,
      \o_address_reg[2]\(2 downto 0) => rgt_address(2 downto 0),
      \o_address_reg[2]_0\ => rgt_n_10,
      \o_address_reg[3]\ => rgt_n_0,
      \o_address_reg[3]_0\ => rgt_n_1,
      \o_address_reg[3]_1\ => rgt_n_11,
      \o_address_reg[4]\ => rgt_n_12,
      \o_address_reg[5]\ => rgt_n_13,
      \o_address_reg[6]\ => rgt_n_14,
      \o_address_reg[7]\ => rgt_n_15,
      \o_address_reg[8]\ => rgt_n_16,
      \o_address_reg[9]\ => rgt_n_17,
      \out\(10 downto 3) => \tmp_area_reg__0\(15 downto 8),
      \out\(2 downto 0) => \tmp_area_reg__0\(2 downto 0),
      p_1_in => p_1_in,
      \p_1_in__1\ => \p_1_in__1\,
      start_rgt => start_rgt,
      state(3 downto 0) => state(3 downto 0),
      state1 => state1,
      state180_out => state180_out,
      \state_reg[0]_0\ => bot_n_1,
      \state_reg[0]_1\ => top_n_39,
      \state_reg[0]_2\ => bot_n_8,
      \state_reg[1]_0\ => rgt_n_4,
      \state_reg[1]_1\ => \o_data[7]_i_4_n_0\,
      \state_reg[1]_2\ => \o_data[7]_i_5_n_0\,
      \state_reg[2]\ => \o_address[2]_i_8_n_0\,
      \state_reg[2]_0\ => \o_data[7]_i_7_n_0\,
      \state_reg[3]\ => rgt_n_2,
      \state_reg[3]_0\ => rgt_n_3,
      \state_reg[3]_1\ => lft_n_31,
      \tmp_address_reg[0]_0\ => lft_n_0,
      \tmp_address_reg[10]_0\ => top_n_12,
      \tmp_address_reg[11]_0\ => top_n_13,
      \tmp_address_reg[12]_0\ => top_n_14,
      \tmp_address_reg[13]_0\ => top_n_15,
      \tmp_address_reg[14]_0\ => top_n_16,
      \tmp_address_reg[15]_0\ => top_n_17,
      \tmp_address_reg[1]_0\ => lft_n_15,
      \tmp_address_reg[2]_0\ => lft_n_16,
      \tmp_address_reg[3]_0\ => top_n_5,
      \tmp_address_reg[4]_0\ => top_n_6,
      \tmp_address_reg[5]_0\ => top_n_7,
      \tmp_address_reg[6]_0\ => top_n_8,
      \tmp_address_reg[7]_0\ => top_n_9,
      \tmp_address_reg[8]_0\ => top_n_10,
      \tmp_address_reg[9]_0\ => top_n_11,
      \tmp_area_reg[15]_0\(15) => rgt_n_26,
      \tmp_area_reg[15]_0\(14) => rgt_n_27,
      \tmp_area_reg[15]_0\(13) => rgt_n_28,
      \tmp_area_reg[15]_0\(12) => rgt_n_29,
      \tmp_area_reg[15]_0\(11) => rgt_n_30,
      \tmp_area_reg[15]_0\(10) => rgt_n_31,
      \tmp_area_reg[15]_0\(9) => rgt_n_32,
      \tmp_area_reg[15]_0\(8) => rgt_n_33,
      \tmp_area_reg[15]_0\(7) => rgt_n_34,
      \tmp_area_reg[15]_0\(6) => rgt_n_35,
      \tmp_area_reg[15]_0\(5) => rgt_n_36,
      \tmp_area_reg[15]_0\(4) => rgt_n_37,
      \tmp_area_reg[15]_0\(3) => rgt_n_38,
      \tmp_area_reg[15]_0\(2) => rgt_n_39,
      \tmp_area_reg[15]_0\(1) => rgt_n_40,
      \tmp_area_reg[15]_0\(0) => rgt_n_41,
      \tmp_area_reg[6]_0\(3) => top_n_70,
      \tmp_area_reg[6]_0\(2) => top_n_71,
      \tmp_area_reg[6]_0\(1) => top_n_72,
      \tmp_area_reg[6]_0\(0) => top_n_73,
      \tmp_area_reg[7]_0\(0) => top_n_74
    );
start_bot_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555550001"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => i_start_IBUF,
      I2 => state(1),
      I3 => state(0),
      I4 => state(3),
      I5 => state(2),
      O => p_51_in
    );
start_bot_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => top_n_49,
      Q => start_bot,
      R => '0'
    );
start_lft_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => top_n_18,
      Q => start_lft,
      R => '0'
    );
start_rgt_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => top_n_21,
      Q => start_rgt,
      R => '0'
    );
start_top_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0008"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => state(3),
      I4 => start_top,
      O => start_top_i_1_n_0
    );
start_top_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => start_top_i_1_n_0,
      Q => start_top,
      R => i_rst_IBUF
    );
\state[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      O => \state[0]_i_3_n_0\
    );
\state[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => state(3),
      O => \state[0]_i_5_n_0\
    );
\state[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      O => \state[0]_i_7_n_0\
    );
\state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      O => \p_1_in__1\
    );
\state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDDF"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      O => \state[2]_i_4_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => top_n_75,
      Q => state(0),
      R => i_rst_IBUF
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => rgt_n_4,
      Q => state(1),
      R => '0'
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => top_n_1,
      Q => state(2),
      R => '0'
    );
\state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => '1',
      D => rgt_n_2,
      Q => state(3),
      R => '0'
    );
\threshold[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      I2 => state(0),
      I3 => state(1),
      O => \threshold[7]_i_1_n_0\
    );
\threshold_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(0),
      Q => threshold(0),
      R => i_rst_IBUF
    );
\threshold_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(1),
      Q => threshold(1),
      R => i_rst_IBUF
    );
\threshold_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(2),
      Q => threshold(2),
      R => i_rst_IBUF
    );
\threshold_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(3),
      Q => threshold(3),
      R => i_rst_IBUF
    );
\threshold_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(4),
      Q => threshold(4),
      R => i_rst_IBUF
    );
\threshold_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(5),
      Q => threshold(5),
      R => i_rst_IBUF
    );
\threshold_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(6),
      Q => threshold(6),
      R => i_rst_IBUF
    );
\threshold_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \threshold[7]_i_1_n_0\,
      D => i_data_IBUF(7),
      Q => threshold(7),
      R => i_rst_IBUF
    );
\tmp_address_reg[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_clk_IBUF_BUFG,
      O => \tmp_address_reg[0]_i_3_n_0\
    );
\tmp_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_65,
      Q => tmp_area(0),
      R => top_n_41
    );
\tmp_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_55,
      Q => tmp_area(10),
      R => top_n_41
    );
\tmp_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_54,
      Q => tmp_area(11),
      R => top_n_41
    );
\tmp_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_53,
      Q => tmp_area(12),
      R => top_n_41
    );
\tmp_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_52,
      Q => tmp_area(13),
      R => top_n_41
    );
\tmp_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_51,
      Q => tmp_area(14),
      R => top_n_41
    );
\tmp_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_50,
      Q => tmp_area(15),
      R => top_n_41
    );
\tmp_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_64,
      Q => tmp_area(1),
      R => top_n_41
    );
\tmp_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_63,
      Q => tmp_area(2),
      R => top_n_41
    );
\tmp_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_62,
      Q => tmp_area(3),
      R => top_n_41
    );
\tmp_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_61,
      Q => tmp_area(4),
      R => top_n_41
    );
\tmp_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_60,
      Q => tmp_area(5),
      R => top_n_41
    );
\tmp_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_59,
      Q => tmp_area(6),
      R => top_n_41
    );
\tmp_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_58,
      Q => tmp_area(7),
      R => top_n_41
    );
\tmp_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_57,
      Q => tmp_area(8),
      R => top_n_41
    );
\tmp_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => bot_n_5,
      D => top_n_56,
      Q => tmp_area(9),
      R => top_n_41
    );
top: entity work.comp_top
     port map (
      CO(0) => o_end2,
      D(15) => top_n_50,
      D(14) => top_n_51,
      D(13) => top_n_52,
      D(12) => top_n_53,
      D(11) => top_n_54,
      D(10) => top_n_55,
      D(9) => top_n_56,
      D(8) => top_n_57,
      D(7) => top_n_58,
      D(6) => top_n_59,
      D(5) => top_n_60,
      D(4) => top_n_61,
      D(3) => top_n_62,
      D(2) => top_n_63,
      D(1) => top_n_64,
      D(0) => top_n_65,
      DI(3) => bot_n_9,
      DI(2) => bot_n_10,
      DI(1) => bot_n_11,
      DI(0) => bot_n_12,
      Q(7 downto 0) => height(7 downto 0),
      S(3) => bot_n_13,
      S(2) => bot_n_14,
      S(1) => bot_n_15,
      S(0) => bot_n_16,
      SR(0) => top_n_41,
      i_clk => \tmp_address_reg[0]_i_3_n_0\,
      i_clk_IBUF_BUFG => i_clk_IBUF_BUFG,
      i_rst_IBUF => i_rst_IBUF,
      i_start_IBUF => i_start_IBUF,
      multiplied => multiplied,
      \o_address_reg[0]_0\ => top_n_2,
      \o_address_reg[10]_0\ => top_n_12,
      \o_address_reg[11]_0\ => top_n_13,
      \o_address_reg[12]_0\ => top_n_14,
      \o_address_reg[13]_0\ => top_n_15,
      \o_address_reg[14]_0\ => top_n_16,
      \o_address_reg[15]_0\ => top_n_17,
      \o_address_reg[15]_1\(15 downto 0) => bot_address(15 downto 0),
      \o_address_reg[1]_0\ => top_n_3,
      \o_address_reg[2]_0\ => top_n_4,
      \o_address_reg[3]_0\ => top_n_5,
      \o_address_reg[4]_0\ => top_n_6,
      \o_address_reg[5]_0\ => top_n_7,
      \o_address_reg[6]_0\ => top_n_8,
      \o_address_reg[7]_0\ => top_n_9,
      \o_address_reg[8]_0\ => top_n_10,
      \o_address_reg[9]_0\ => top_n_11,
      \o_area_reg[0]\(0) => rgt_n_41,
      \o_area_reg[0]_0\(0) => lft_n_33,
      \o_area_reg[14]\(13 downto 0) => \p_1_in__0\(14 downto 1),
      \o_area_reg[15]\(15) => bot_n_48,
      \o_area_reg[15]\(14) => bot_n_49,
      \o_area_reg[15]\(13) => bot_n_50,
      \o_area_reg[15]\(12) => bot_n_51,
      \o_area_reg[15]\(11) => bot_n_52,
      \o_area_reg[15]\(10) => bot_n_53,
      \o_area_reg[15]\(9) => bot_n_54,
      \o_area_reg[15]\(8) => bot_n_55,
      \o_area_reg[15]\(7) => bot_n_56,
      \o_area_reg[15]\(6) => bot_n_57,
      \o_area_reg[15]\(5) => bot_n_58,
      \o_area_reg[15]\(4) => bot_n_59,
      \o_area_reg[15]\(3) => bot_n_60,
      \o_area_reg[15]\(2) => bot_n_61,
      \o_area_reg[15]\(1) => bot_n_62,
      \o_area_reg[15]\(0) => bot_n_63,
      \o_area_reg[15]_0\ => lft_n_32,
      o_done_reg => top_n_40,
      o_en_reg => top_n_43,
      o_end_reg_0 => bot_n_4,
      o_end_reg_1 => bot_n_0,
      o_end_reg_2 => rgt_n_0,
      o_we_reg => top_n_42,
      \out\(15 downto 0) => \tmp_area_reg__0\(15 downto 0),
      \p_1_in__1\ => \p_1_in__1\,
      p_51_in => p_51_in,
      \real_height_reg[7]\(7 downto 0) => y_top(7 downto 0),
      start_bot => start_bot,
      start_bot_reg => top_n_49,
      start_lft => start_lft,
      start_lft_reg => top_n_18,
      start_rgt => start_rgt,
      start_rgt_reg => top_n_21,
      start_top => start_top,
      state(3 downto 0) => state(3 downto 0),
      state1 => state1,
      state172_out => state172_out,
      state174_out => state174_out,
      state176_out => state176_out,
      state180_out => state180_out,
      \state_reg[0]_0\ => top_n_75,
      \state_reg[0]_1\ => bot_n_8,
      \state_reg[1]_0\ => top_n_38,
      \state_reg[1]_1\ => \o_data[7]_i_4_n_0\,
      \state_reg[1]_2\ => rgt_n_3,
      \state_reg[1]_3\ => \o_data[7]_i_5_n_0\,
      \state_reg[1]_4\ => \state[0]_i_5_n_0\,
      \state_reg[1]_5\ => \state[0]_i_7_n_0\,
      \state_reg[2]\ => top_n_1,
      \state_reg[2]_0\ => \o_address[2]_i_14_n_0\,
      \state_reg[2]_1\ => \o_address[2]_i_8_n_0\,
      \state_reg[3]\ => top_n_39,
      \state_reg[3]_0\ => bot_n_3,
      \state_reg[3]_1\ => \state[2]_i_4_n_0\,
      \state_reg[3]_2\ => \state[0]_i_3_n_0\,
      \tmp_address_reg[11]_0\(0) => top_n_74,
      \tmp_address_reg[15]_0\(12 downto 0) => lft_address(15 downto 3),
      \tmp_address_reg[3]_0\(3) => top_n_66,
      \tmp_address_reg[3]_0\(2) => top_n_67,
      \tmp_address_reg[3]_0\(1) => top_n_68,
      \tmp_address_reg[3]_0\(0) => top_n_69,
      \tmp_address_reg[4]_0\(0) => top_n_48,
      \tmp_address_reg[7]_0\(3) => top_n_44,
      \tmp_address_reg[7]_0\(2) => top_n_45,
      \tmp_address_reg[7]_0\(1) => top_n_46,
      \tmp_address_reg[7]_0\(0) => top_n_47,
      \tmp_address_reg[7]_1\(3) => top_n_70,
      \tmp_address_reg[7]_1\(2) => top_n_71,
      \tmp_address_reg[7]_1\(1) => top_n_72,
      \tmp_address_reg[7]_1\(0) => top_n_73,
      \tmp_area_reg[15]_0\(15 downto 0) => tmp_area(15 downto 0),
      \total_area_reg[15]\(15 downto 0) => total_area(15 downto 0),
      \width_reg[7]\(7 downto 0) => width(7 downto 0)
    );
\total_area[10]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(1),
      I1 => height(7),
      O => \total_area[10]_i_10_n_0\
    );
\total_area[10]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => height(7),
      I1 => width(2),
      I2 => \total_area_reg[14]_i_14_n_5\,
      I3 => \total_area_reg[14]_i_15_n_6\,
      O => \total_area[10]_i_11_n_0\
    );
\total_area[10]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => height(7),
      I1 => width(1),
      I2 => \total_area_reg[14]_i_14_n_6\,
      I3 => \total_area_reg[14]_i_15_n_7\,
      O => \total_area[10]_i_12_n_0\
    );
\total_area[10]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => height(7),
      I1 => width(2),
      I2 => \total_area_reg[14]_i_14_n_5\,
      I3 => \total_area_reg[14]_i_15_n_6\,
      O => \total_area[10]_i_13_n_0\
    );
\total_area[10]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => height(7),
      I1 => width(1),
      I2 => \total_area_reg[14]_i_14_n_6\,
      I3 => \total_area_reg[14]_i_15_n_7\,
      O => \total_area[10]_i_14_n_0\
    );
\total_area[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD4D400D400D400"
    )
        port map (
      I0 => \total_area[10]_i_10_n_0\,
      I1 => \total_area_reg[14]_i_14_n_6\,
      I2 => \total_area_reg[14]_i_15_n_7\,
      I3 => \total_area[10]_i_11_n_0\,
      I4 => height(6),
      I5 => width(3),
      O => \total_area[10]_i_2_n_0\
    );
\total_area[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0800080000000"
    )
        port map (
      I0 => \total_area_reg[6]_i_3_n_5\,
      I1 => \total_area_reg[3]_i_2_n_4\,
      I2 => height(6),
      I3 => width(1),
      I4 => \total_area[10]_i_12_n_0\,
      I5 => width(2),
      O => \total_area[10]_i_3_n_0\
    );
\total_area[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"807FFF007F80FF00"
    )
        port map (
      I0 => width(1),
      I1 => \total_area_reg[3]_i_2_n_4\,
      I2 => \total_area_reg[6]_i_3_n_5\,
      I3 => \total_area[10]_i_12_n_0\,
      I4 => height(6),
      I5 => width(2),
      O => \total_area[10]_i_4_n_0\
    );
\total_area[10]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => height(7),
      I1 => width(0),
      I2 => \total_area_reg[14]_i_14_n_7\,
      I3 => \total_area_reg[6]_i_3_n_4\,
      O => \total_area[10]_i_5_n_0\
    );
\total_area[10]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A95956A"
    )
        port map (
      I0 => \total_area[10]_i_2_n_0\,
      I1 => width(4),
      I2 => height(6),
      I3 => \total_area[14]_i_16_n_0\,
      I4 => \total_area[10]_i_13_n_0\,
      O => \total_area[10]_i_6_n_0\
    );
\total_area[10]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A95956A"
    )
        port map (
      I0 => \total_area[10]_i_3_n_0\,
      I1 => width(3),
      I2 => height(6),
      I3 => \total_area[10]_i_11_n_0\,
      I4 => \total_area[10]_i_14_n_0\,
      O => \total_area[10]_i_7_n_0\
    );
\total_area[10]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"566A6A6A"
    )
        port map (
      I0 => \total_area[10]_i_4_n_0\,
      I1 => \total_area_reg[6]_i_3_n_4\,
      I2 => \total_area_reg[14]_i_14_n_7\,
      I3 => width(0),
      I4 => height(7),
      O => \total_area[10]_i_8_n_0\
    );
\total_area[10]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956A6A6A"
    )
        port map (
      I0 => \total_area[10]_i_5_n_0\,
      I1 => width(1),
      I2 => height(6),
      I3 => \total_area_reg[3]_i_2_n_4\,
      I4 => \total_area_reg[6]_i_3_n_5\,
      O => \total_area[10]_i_9_n_0\
    );
\total_area[14]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(7),
      I1 => height(6),
      O => \total_area[14]_i_10_n_0\
    );
\total_area[14]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(6),
      I1 => height(6),
      O => \total_area[14]_i_11_n_0\
    );
\total_area[14]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => height(7),
      I1 => width(3),
      I2 => \total_area_reg[14]_i_14_n_4\,
      I3 => \total_area_reg[14]_i_15_n_1\,
      O => \total_area[14]_i_12_n_0\
    );
\total_area[14]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(2),
      I1 => height(7),
      O => \total_area[14]_i_13_n_0\
    );
\total_area[14]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => height(7),
      I1 => width(3),
      I2 => \total_area_reg[14]_i_14_n_4\,
      I3 => \total_area_reg[14]_i_15_n_1\,
      O => \total_area[14]_i_16_n_0\
    );
\total_area[14]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \total_area_reg[15]_i_3_n_6\,
      I1 => height(7),
      I2 => width(5),
      O => \total_area[14]_i_17_n_0\
    );
\total_area[14]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78888777"
    )
        port map (
      I0 => width(7),
      I1 => height(6),
      I2 => height(7),
      I3 => width(6),
      I4 => \total_area_reg[15]_i_3_n_1\,
      O => \total_area[14]_i_18_n_0\
    );
\total_area[14]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78888777"
    )
        port map (
      I0 => width(6),
      I1 => height(6),
      I2 => height(7),
      I3 => width(5),
      I4 => \total_area_reg[15]_i_3_n_6\,
      O => \total_area[14]_i_19_n_0\
    );
\total_area[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00808000B3CCFF80"
    )
        port map (
      I0 => \total_area_reg[15]_i_3_n_6\,
      I1 => height(7),
      I2 => width(5),
      I3 => \total_area_reg[15]_i_3_n_1\,
      I4 => width(6),
      I5 => \total_area[14]_i_10_n_0\,
      O => \total_area[14]_i_2_n_0\
    );
\total_area[14]_i_20\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => height(7),
      I1 => width(4),
      I2 => \total_area_reg[15]_i_3_n_7\,
      O => \total_area[14]_i_20_n_0\
    );
\total_area[14]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(3),
      I1 => width(6),
      I2 => width(4),
      I3 => height(5),
      I4 => width(5),
      I5 => height(4),
      O => \total_area[14]_i_21_n_0\
    );
\total_area[14]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(3),
      I1 => width(5),
      I2 => width(3),
      I3 => height(5),
      I4 => width(4),
      I5 => height(4),
      O => \total_area[14]_i_22_n_0\
    );
\total_area[14]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(3),
      I1 => width(4),
      I2 => width(2),
      I3 => height(5),
      I4 => width(3),
      I5 => height(4),
      O => \total_area[14]_i_23_n_0\
    );
\total_area[14]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(3),
      I1 => width(3),
      I2 => width(1),
      I3 => height(5),
      I4 => width(2),
      I5 => height(4),
      O => \total_area[14]_i_24_n_0\
    );
\total_area[14]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[14]_i_21_n_0\,
      I1 => height(4),
      I2 => width(6),
      I3 => \total_area[14]_i_33_n_0\,
      I4 => width(7),
      I5 => height(3),
      O => \total_area[14]_i_25_n_0\
    );
\total_area[14]_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[14]_i_22_n_0\,
      I1 => height(4),
      I2 => width(5),
      I3 => \total_area[14]_i_34_n_0\,
      I4 => width(6),
      I5 => height(3),
      O => \total_area[14]_i_26_n_0\
    );
\total_area[14]_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[14]_i_23_n_0\,
      I1 => height(4),
      I2 => width(4),
      I3 => \total_area[14]_i_35_n_0\,
      I4 => width(5),
      I5 => height(3),
      O => \total_area[14]_i_27_n_0\
    );
\total_area[14]_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[14]_i_24_n_0\,
      I1 => height(4),
      I2 => width(3),
      I3 => \total_area[14]_i_36_n_0\,
      I4 => width(4),
      I5 => height(3),
      O => \total_area[14]_i_28_n_0\
    );
\total_area[14]_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => height(2),
      I1 => width(6),
      I2 => height(1),
      I3 => width(7),
      O => \total_area[14]_i_29_n_0\
    );
\total_area[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00808000B3CCFF80"
    )
        port map (
      I0 => \total_area_reg[15]_i_3_n_7\,
      I1 => height(7),
      I2 => width(4),
      I3 => \total_area_reg[15]_i_3_n_6\,
      I4 => width(5),
      I5 => \total_area[14]_i_11_n_0\,
      O => \total_area[14]_i_3_n_0\
    );
\total_area[14]_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(0),
      I1 => width(7),
      I2 => width(5),
      I3 => height(2),
      I4 => width(6),
      I5 => height(1),
      O => \total_area[14]_i_30_n_0\
    );
\total_area[14]_i_31\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => height(1),
      I1 => width(6),
      I2 => height(2),
      I3 => width(7),
      O => \total_area[14]_i_31_n_0\
    );
\total_area[14]_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E73F50007800F000"
    )
        port map (
      I0 => width(5),
      I1 => height(0),
      I2 => width(6),
      I3 => height(2),
      I4 => width(7),
      I5 => height(1),
      O => \total_area[14]_i_32_n_0\
    );
\total_area[14]_i_33\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(5),
      I1 => height(5),
      O => \total_area[14]_i_33_n_0\
    );
\total_area[14]_i_34\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(4),
      I1 => height(5),
      O => \total_area[14]_i_34_n_0\
    );
\total_area[14]_i_35\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(3),
      I1 => height(5),
      O => \total_area[14]_i_35_n_0\
    );
\total_area[14]_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(2),
      I1 => height(5),
      O => \total_area[14]_i_36_n_0\
    );
\total_area[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEEE288828882888"
    )
        port map (
      I0 => \total_area[14]_i_12_n_0\,
      I1 => \total_area_reg[15]_i_3_n_7\,
      I2 => width(4),
      I3 => height(7),
      I4 => height(6),
      I5 => width(5),
      O => \total_area[14]_i_4_n_0\
    );
\total_area[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD4D400D400D400"
    )
        port map (
      I0 => \total_area[14]_i_13_n_0\,
      I1 => \total_area_reg[14]_i_14_n_5\,
      I2 => \total_area_reg[14]_i_15_n_6\,
      I3 => \total_area[14]_i_16_n_0\,
      I4 => height(6),
      I5 => width(4),
      O => \total_area[14]_i_5_n_0\
    );
\total_area[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FEC1C801CEC7080"
    )
        port map (
      I0 => height(6),
      I1 => \total_area[14]_i_17_n_0\,
      I2 => width(7),
      I3 => height(7),
      I4 => \total_area_reg[15]_i_3_n_1\,
      I5 => width(6),
      O => \total_area[14]_i_6_n_0\
    );
\total_area[14]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999999"
    )
        port map (
      I0 => \total_area[14]_i_3_n_0\,
      I1 => \total_area[14]_i_18_n_0\,
      I2 => \total_area_reg[15]_i_3_n_6\,
      I3 => height(7),
      I4 => width(5),
      O => \total_area[14]_i_7_n_0\
    );
\total_area[14]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999999"
    )
        port map (
      I0 => \total_area[14]_i_4_n_0\,
      I1 => \total_area[14]_i_19_n_0\,
      I2 => \total_area_reg[15]_i_3_n_7\,
      I3 => height(7),
      I4 => width(4),
      O => \total_area[14]_i_8_n_0\
    );
\total_area[14]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A95956A"
    )
        port map (
      I0 => \total_area[14]_i_5_n_0\,
      I1 => width(5),
      I2 => height(6),
      I3 => \total_area[14]_i_20_n_0\,
      I4 => \total_area[14]_i_12_n_0\,
      O => \total_area[14]_i_9_n_0\
    );
\total_area[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => width(7),
      I1 => width(6),
      I2 => height(7),
      I3 => \total_area_reg[15]_i_3_n_1\,
      O => \total_area[15]_i_2_n_0\
    );
\total_area[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => height(5),
      I1 => width(6),
      I2 => height(4),
      I3 => width(7),
      O => \total_area[15]_i_4_n_0\
    );
\total_area[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(3),
      I1 => width(7),
      I2 => width(5),
      I3 => height(5),
      I4 => width(6),
      I5 => height(4),
      O => \total_area[15]_i_5_n_0\
    );
\total_area[15]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => height(4),
      I1 => width(6),
      I2 => height(5),
      I3 => width(7),
      O => \total_area[15]_i_6_n_0\
    );
\total_area[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E73F50007800F000"
    )
        port map (
      I0 => width(5),
      I1 => height(3),
      I2 => width(6),
      I3 => height(5),
      I4 => width(7),
      I5 => height(4),
      O => \total_area[15]_i_7_n_0\
    );
\total_area[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => height(0),
      I1 => width(3),
      I2 => width(1),
      I3 => height(2),
      I4 => width(2),
      I5 => height(1),
      O => \total_area[2]_i_2_n_0\
    );
\total_area[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => height(1),
      I1 => width(1),
      I2 => height(2),
      I3 => width(0),
      O => \total_area[2]_i_3_n_0\
    );
\total_area[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => width(1),
      I1 => height(0),
      O => \total_area[2]_i_4_n_0\
    );
\total_area[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9C936C9393939393"
    )
        port map (
      I0 => width(2),
      I1 => \total_area[2]_i_9_n_0\,
      I2 => height(1),
      I3 => height(2),
      I4 => width(0),
      I5 => width(1),
      O => \total_area[2]_i_5_n_0\
    );
\total_area[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => width(0),
      I1 => height(2),
      I2 => width(1),
      I3 => height(1),
      I4 => height(0),
      I5 => width(2),
      O => \total_area[2]_i_6_n_0\
    );
\total_area[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => height(0),
      I1 => width(1),
      I2 => height(1),
      I3 => width(0),
      O => \total_area[2]_i_7_n_0\
    );
\total_area[2]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => width(0),
      I1 => height(0),
      O => \total_area[2]_i_8_n_0\
    );
\total_area[2]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(3),
      I1 => height(0),
      O => \total_area[2]_i_9_n_0\
    );
\total_area[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \total_area_reg[2]_i_1_n_4\,
      I1 => \total_area_reg[3]_i_2_n_7\,
      O => total_area0(3)
    );
\total_area[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(3),
      I1 => height(3),
      O => \total_area[3]_i_10_n_0\
    );
\total_area[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => height(3),
      I1 => width(3),
      I2 => width(1),
      I3 => height(5),
      I4 => width(2),
      I5 => height(4),
      O => \total_area[3]_i_3_n_0\
    );
\total_area[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => height(4),
      I1 => width(1),
      I2 => height(5),
      I3 => width(0),
      O => \total_area[3]_i_4_n_0\
    );
\total_area[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => width(1),
      I1 => height(3),
      O => \total_area[3]_i_5_n_0\
    );
\total_area[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9C936C9393939393"
    )
        port map (
      I0 => width(2),
      I1 => \total_area[3]_i_10_n_0\,
      I2 => height(4),
      I3 => height(5),
      I4 => width(0),
      I5 => width(1),
      O => \total_area[3]_i_6_n_0\
    );
\total_area[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => width(0),
      I1 => height(5),
      I2 => width(1),
      I3 => height(4),
      I4 => height(3),
      I5 => width(2),
      O => \total_area[3]_i_7_n_0\
    );
\total_area[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => height(3),
      I1 => width(1),
      I2 => height(4),
      I3 => width(0),
      O => \total_area[3]_i_8_n_0\
    );
\total_area[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => width(0),
      I1 => height(3),
      O => \total_area[3]_i_9_n_0\
    );
\total_area[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(0),
      I1 => width(4),
      I2 => width(2),
      I3 => height(2),
      I4 => width(3),
      I5 => height(1),
      O => \total_area[6]_i_10_n_0\
    );
\total_area[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(0),
      I1 => width(3),
      I2 => width(1),
      I3 => height(2),
      I4 => width(2),
      I5 => height(1),
      O => \total_area[6]_i_11_n_0\
    );
\total_area[6]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[6]_i_8_n_0\,
      I1 => height(1),
      I2 => width(6),
      I3 => \total_area[6]_i_16_n_0\,
      I4 => width(7),
      I5 => height(0),
      O => \total_area[6]_i_12_n_0\
    );
\total_area[6]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[6]_i_9_n_0\,
      I1 => height(1),
      I2 => width(5),
      I3 => \total_area[6]_i_17_n_0\,
      I4 => width(6),
      I5 => height(0),
      O => \total_area[6]_i_13_n_0\
    );
\total_area[6]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[6]_i_10_n_0\,
      I1 => height(1),
      I2 => width(4),
      I3 => \total_area[6]_i_18_n_0\,
      I4 => width(5),
      I5 => height(0),
      O => \total_area[6]_i_14_n_0\
    );
\total_area[6]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A956A956A95"
    )
        port map (
      I0 => \total_area[6]_i_11_n_0\,
      I1 => height(1),
      I2 => width(3),
      I3 => \total_area[6]_i_19_n_0\,
      I4 => width(4),
      I5 => height(0),
      O => \total_area[6]_i_15_n_0\
    );
\total_area[6]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(5),
      I1 => height(2),
      O => \total_area[6]_i_16_n_0\
    );
\total_area[6]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(4),
      I1 => height(2),
      O => \total_area[6]_i_17_n_0\
    );
\total_area[6]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(3),
      I1 => height(2),
      O => \total_area[6]_i_18_n_0\
    );
\total_area[6]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => width(2),
      I1 => height(2),
      O => \total_area[6]_i_19_n_0\
    );
\total_area[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \total_area_reg[6]_i_3_n_5\,
      I1 => \total_area_reg[3]_i_2_n_4\,
      O => \total_area[6]_i_2_n_0\
    );
\total_area[6]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \total_area_reg[3]_i_2_n_4\,
      I1 => \total_area_reg[6]_i_3_n_5\,
      I2 => height(6),
      I3 => width(0),
      O => \total_area[6]_i_4_n_0\
    );
\total_area[6]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \total_area_reg[6]_i_3_n_6\,
      I1 => \total_area_reg[3]_i_2_n_5\,
      O => \total_area[6]_i_5_n_0\
    );
\total_area[6]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \total_area_reg[6]_i_3_n_7\,
      I1 => \total_area_reg[3]_i_2_n_6\,
      O => \total_area[6]_i_6_n_0\
    );
\total_area[6]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \total_area_reg[2]_i_1_n_4\,
      I1 => \total_area_reg[3]_i_2_n_7\,
      O => \total_area[6]_i_7_n_0\
    );
\total_area[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(0),
      I1 => width(6),
      I2 => width(4),
      I3 => height(2),
      I4 => width(5),
      I5 => height(1),
      O => \total_area[6]_i_8_n_0\
    );
\total_area[6]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => height(0),
      I1 => width(5),
      I2 => width(3),
      I3 => height(2),
      I4 => width(4),
      I5 => height(1),
      O => \total_area[6]_i_9_n_0\
    );
\total_area_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(0),
      Q => total_area(0),
      R => '0'
    );
\total_area_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(10),
      Q => total_area(10),
      R => '0'
    );
\total_area_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[6]_i_1_n_0\,
      CO(3) => \total_area_reg[10]_i_1_n_0\,
      CO(2) => \total_area_reg[10]_i_1_n_1\,
      CO(1) => \total_area_reg[10]_i_1_n_2\,
      CO(0) => \total_area_reg[10]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[10]_i_2_n_0\,
      DI(2) => \total_area[10]_i_3_n_0\,
      DI(1) => \total_area[10]_i_4_n_0\,
      DI(0) => \total_area[10]_i_5_n_0\,
      O(3 downto 0) => total_area0(10 downto 7),
      S(3) => \total_area[10]_i_6_n_0\,
      S(2) => \total_area[10]_i_7_n_0\,
      S(1) => \total_area[10]_i_8_n_0\,
      S(0) => \total_area[10]_i_9_n_0\
    );
\total_area_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(11),
      Q => total_area(11),
      R => '0'
    );
\total_area_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(12),
      Q => total_area(12),
      R => '0'
    );
\total_area_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(13),
      Q => total_area(13),
      R => '0'
    );
\total_area_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(14),
      Q => total_area(14),
      R => '0'
    );
\total_area_reg[14]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[10]_i_1_n_0\,
      CO(3) => \total_area_reg[14]_i_1_n_0\,
      CO(2) => \total_area_reg[14]_i_1_n_1\,
      CO(1) => \total_area_reg[14]_i_1_n_2\,
      CO(0) => \total_area_reg[14]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[14]_i_2_n_0\,
      DI(2) => \total_area[14]_i_3_n_0\,
      DI(1) => \total_area[14]_i_4_n_0\,
      DI(0) => \total_area[14]_i_5_n_0\,
      O(3 downto 0) => total_area0(14 downto 11),
      S(3) => \total_area[14]_i_6_n_0\,
      S(2) => \total_area[14]_i_7_n_0\,
      S(1) => \total_area[14]_i_8_n_0\,
      S(0) => \total_area[14]_i_9_n_0\
    );
\total_area_reg[14]_i_14\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[3]_i_2_n_0\,
      CO(3) => \total_area_reg[14]_i_14_n_0\,
      CO(2) => \total_area_reg[14]_i_14_n_1\,
      CO(1) => \total_area_reg[14]_i_14_n_2\,
      CO(0) => \total_area_reg[14]_i_14_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[14]_i_21_n_0\,
      DI(2) => \total_area[14]_i_22_n_0\,
      DI(1) => \total_area[14]_i_23_n_0\,
      DI(0) => \total_area[14]_i_24_n_0\,
      O(3) => \total_area_reg[14]_i_14_n_4\,
      O(2) => \total_area_reg[14]_i_14_n_5\,
      O(1) => \total_area_reg[14]_i_14_n_6\,
      O(0) => \total_area_reg[14]_i_14_n_7\,
      S(3) => \total_area[14]_i_25_n_0\,
      S(2) => \total_area[14]_i_26_n_0\,
      S(1) => \total_area[14]_i_27_n_0\,
      S(0) => \total_area[14]_i_28_n_0\
    );
\total_area_reg[14]_i_15\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[6]_i_3_n_0\,
      CO(3) => \NLW_total_area_reg[14]_i_15_CO_UNCONNECTED\(3),
      CO(2) => \total_area_reg[14]_i_15_n_1\,
      CO(1) => \NLW_total_area_reg[14]_i_15_CO_UNCONNECTED\(1),
      CO(0) => \total_area_reg[14]_i_15_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \total_area[14]_i_29_n_0\,
      DI(0) => \total_area[14]_i_30_n_0\,
      O(3 downto 2) => \NLW_total_area_reg[14]_i_15_O_UNCONNECTED\(3 downto 2),
      O(1) => \total_area_reg[14]_i_15_n_6\,
      O(0) => \total_area_reg[14]_i_15_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \total_area[14]_i_31_n_0\,
      S(0) => \total_area[14]_i_32_n_0\
    );
\total_area_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(15),
      Q => total_area(15),
      R => '0'
    );
\total_area_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[14]_i_1_n_0\,
      CO(3 downto 0) => \NLW_total_area_reg[15]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_total_area_reg[15]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => total_area0(15),
      S(3 downto 1) => B"000",
      S(0) => \total_area[15]_i_2_n_0\
    );
\total_area_reg[15]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[14]_i_14_n_0\,
      CO(3) => \NLW_total_area_reg[15]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \total_area_reg[15]_i_3_n_1\,
      CO(1) => \NLW_total_area_reg[15]_i_3_CO_UNCONNECTED\(1),
      CO(0) => \total_area_reg[15]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \total_area[15]_i_4_n_0\,
      DI(0) => \total_area[15]_i_5_n_0\,
      O(3 downto 2) => \NLW_total_area_reg[15]_i_3_O_UNCONNECTED\(3 downto 2),
      O(1) => \total_area_reg[15]_i_3_n_6\,
      O(0) => \total_area_reg[15]_i_3_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \total_area[15]_i_6_n_0\,
      S(0) => \total_area[15]_i_7_n_0\
    );
\total_area_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(1),
      Q => total_area(1),
      R => '0'
    );
\total_area_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(2),
      Q => total_area(2),
      R => '0'
    );
\total_area_reg[2]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \total_area_reg[2]_i_1_n_0\,
      CO(2) => \total_area_reg[2]_i_1_n_1\,
      CO(1) => \total_area_reg[2]_i_1_n_2\,
      CO(0) => \total_area_reg[2]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[2]_i_2_n_0\,
      DI(2) => \total_area[2]_i_3_n_0\,
      DI(1) => \total_area[2]_i_4_n_0\,
      DI(0) => '0',
      O(3) => \total_area_reg[2]_i_1_n_4\,
      O(2 downto 0) => total_area0(2 downto 0),
      S(3) => \total_area[2]_i_5_n_0\,
      S(2) => \total_area[2]_i_6_n_0\,
      S(1) => \total_area[2]_i_7_n_0\,
      S(0) => \total_area[2]_i_8_n_0\
    );
\total_area_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(3),
      Q => total_area(3),
      R => '0'
    );
\total_area_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \total_area_reg[3]_i_2_n_0\,
      CO(2) => \total_area_reg[3]_i_2_n_1\,
      CO(1) => \total_area_reg[3]_i_2_n_2\,
      CO(0) => \total_area_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[3]_i_3_n_0\,
      DI(2) => \total_area[3]_i_4_n_0\,
      DI(1) => \total_area[3]_i_5_n_0\,
      DI(0) => '0',
      O(3) => \total_area_reg[3]_i_2_n_4\,
      O(2) => \total_area_reg[3]_i_2_n_5\,
      O(1) => \total_area_reg[3]_i_2_n_6\,
      O(0) => \total_area_reg[3]_i_2_n_7\,
      S(3) => \total_area[3]_i_6_n_0\,
      S(2) => \total_area[3]_i_7_n_0\,
      S(1) => \total_area[3]_i_8_n_0\,
      S(0) => \total_area[3]_i_9_n_0\
    );
\total_area_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(4),
      Q => total_area(4),
      R => '0'
    );
\total_area_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(5),
      Q => total_area(5),
      R => '0'
    );
\total_area_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(6),
      Q => total_area(6),
      R => '0'
    );
\total_area_reg[6]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \total_area_reg[6]_i_1_n_0\,
      CO(2) => \total_area_reg[6]_i_1_n_1\,
      CO(1) => \total_area_reg[6]_i_1_n_2\,
      CO(0) => \total_area_reg[6]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[6]_i_2_n_0\,
      DI(2) => \total_area_reg[6]_i_3_n_6\,
      DI(1) => \total_area_reg[6]_i_3_n_7\,
      DI(0) => \total_area_reg[2]_i_1_n_4\,
      O(3 downto 1) => total_area0(6 downto 4),
      O(0) => \NLW_total_area_reg[6]_i_1_O_UNCONNECTED\(0),
      S(3) => \total_area[6]_i_4_n_0\,
      S(2) => \total_area[6]_i_5_n_0\,
      S(1) => \total_area[6]_i_6_n_0\,
      S(0) => \total_area[6]_i_7_n_0\
    );
\total_area_reg[6]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \total_area_reg[2]_i_1_n_0\,
      CO(3) => \total_area_reg[6]_i_3_n_0\,
      CO(2) => \total_area_reg[6]_i_3_n_1\,
      CO(1) => \total_area_reg[6]_i_3_n_2\,
      CO(0) => \total_area_reg[6]_i_3_n_3\,
      CYINIT => '0',
      DI(3) => \total_area[6]_i_8_n_0\,
      DI(2) => \total_area[6]_i_9_n_0\,
      DI(1) => \total_area[6]_i_10_n_0\,
      DI(0) => \total_area[6]_i_11_n_0\,
      O(3) => \total_area_reg[6]_i_3_n_4\,
      O(2) => \total_area_reg[6]_i_3_n_5\,
      O(1) => \total_area_reg[6]_i_3_n_6\,
      O(0) => \total_area_reg[6]_i_3_n_7\,
      S(3) => \total_area[6]_i_12_n_0\,
      S(2) => \total_area[6]_i_13_n_0\,
      S(1) => \total_area[6]_i_14_n_0\,
      S(0) => \total_area[6]_i_15_n_0\
    );
\total_area_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(7),
      Q => total_area(7),
      R => '0'
    );
\total_area_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(8),
      Q => total_area(8),
      R => '0'
    );
\total_area_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => multiply,
      CE => '1',
      D => total_area0(9),
      Q => total_area(9),
      R => '0'
    );
\width[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => state(3),
      O => \width[7]_i_1_n_0\
    );
\width_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(0),
      Q => width(0),
      R => i_rst_IBUF
    );
\width_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(1),
      Q => width(1),
      R => i_rst_IBUF
    );
\width_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(2),
      Q => width(2),
      R => i_rst_IBUF
    );
\width_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(3),
      Q => width(3),
      R => i_rst_IBUF
    );
\width_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(4),
      Q => width(4),
      R => i_rst_IBUF
    );
\width_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(5),
      Q => width(5),
      R => i_rst_IBUF
    );
\width_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(6),
      Q => width(6),
      R => i_rst_IBUF
    );
\width_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \width[7]_i_1_n_0\,
      D => i_data_IBUF(7),
      Q => width(7),
      R => i_rst_IBUF
    );
end STRUCTURE;
