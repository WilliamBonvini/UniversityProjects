----------------------------------------------------------------------------------
-- Company: Politecnico di Milano
-- Engineer: Leonardo Barilani, William Bonvini
-- 
-- Create Date: 16.04.2018 21:34:30
-- Design Name: 
-- Module Name: project_reti_logiche - Behavioral
-- Project Name: Image Scanner
-- Target Devices: 
-- Tool Versions: 
-- Description: Scan an image to get the rectangular area covered by the pixels
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity project_reti_logiche is
    port (
        i_clk         : in  std_logic;
        i_start       : in  std_logic;
        i_rst         : in  std_logic;
        i_data        : in  std_logic_vector (7 downto 0); 
        
        o_address     : out std_logic_vector (15 downto 0);
        o_done        : out std_logic;
        o_en          : out std_logic;
        o_we          : out std_logic;
        o_data        : out std_logic_vector (7 downto 0)
    );
end project_reti_logiche;
architecture Behavioral of project_reti_logiche is
    component comp_top is
        port (
            i_clk         : in  std_logic;
            i_start       : in  std_logic;
            i_rst         : in  std_logic;
            i_data        : in  std_logic_vector (7 downto 0); 
            
            o_address     : out std_logic_vector (15 downto 0);
            
            i_width       : in std_logic_vector (7 downto 0);
            i_height      : in std_logic_vector (7 downto 0);
            i_threshold   : in std_logic_vector (7 downto 0);
            
            o_end         : out std_logic;
            o_area        : out unsigned (15 downto 0);
            o_y           : out unsigned (7 downto 0)
        );
    end component;
    component comp_bot is
        port (
            i_clk         : in  std_logic;
            i_start       : in  std_logic;
            i_rst         : in  std_logic;
            i_data        : in  std_logic_vector (7 downto 0); 
            
            o_address     : out std_logic_vector (15 downto 0);
            
            i_width       : in std_logic_vector (7 downto 0);
            i_height      : in std_logic_vector (7 downto 0);
            i_threshold   : in std_logic_vector (7 downto 0);
            i_addr_offset : in std_logic_vector (15 downto 0);
            
            o_end         : out std_logic;
            o_area        : out unsigned (15 downto 0);
            o_y           : out unsigned (7 downto 0)
        );
    end component;
    component comp_lft is
        port (
            i_clk         : in  std_logic;
            i_start       : in  std_logic;
            i_rst         : in  std_logic;
            i_data        : in  std_logic_vector (7 downto 0); 
            
            o_address     : out std_logic_vector (15 downto 0);
            
            i_width       : in std_logic_vector (7 downto 0);
            i_threshold   : in std_logic_vector (7 downto 0);
            i_addr_offset : in std_logic_vector (15 downto 0);
            i_bound_top   : in unsigned (7 downto 0);
            i_bound_bot   : in unsigned (7 downto 0);
                        
            o_end         : out std_logic;
            o_area        : out unsigned (15 downto 0)
        );
    end component;
    component comp_rgt is
        port (
            i_clk         : in  std_logic;
            i_start       : in  std_logic;
            i_rst         : in  std_logic;
            i_data        : in  std_logic_vector (7 downto 0); 
            
            o_address     : out std_logic_vector (15 downto 0);
            
            i_width       : in std_logic_vector (7 downto 0);
            i_threshold   : in std_logic_vector (7 downto 0);
            i_addr_offset : in std_logic_vector (15 downto 0); -- l'offset e' l'area calcolata da top piu' una riga
            i_bound_top   : in unsigned (7 downto 0);
            i_bound_bot   : in unsigned (7 downto 0);
                        
            o_end         : out std_logic;
            o_area        : out unsigned (15 downto 0)
        );
    end component;
type setup_states is (S_BEGIN, S_WIDTH, S_HEIGHT, S_THRESHOLD, S_WAITING_TOP, S_WAITING_BOT, S_WAITING_LFT, S_WAITING_RGT, S_WAITING_RES, S_END_0, S_END_1, S_END_2);
signal state        : setup_states                  := S_BEGIN;
signal width        : std_logic_vector (7 downto 0) := "00000000";
signal height       : std_logic_vector (7 downto 0) := "00000000";
signal threshold    : std_logic_vector (7 downto 0) := "00000000";

signal start_top    : std_logic                     := '0';
signal area_top     : unsigned (15 downto 0);
signal end_top      : std_logic                     := '0';
signal y_top        : unsigned (7 downto 0);

signal start_bot    : std_logic                     := '0';
signal area_bot     : unsigned (15 downto 0);
signal end_bot      : std_logic                     := '0';
signal y_bot        : unsigned (7 downto 0);

signal start_lft    : std_logic                     := '0';
signal area_lft     : unsigned (15 downto 0);
signal end_lft      : std_logic                     := '0';

signal start_rgt    : std_logic                     := '0';
signal area_rgt     : unsigned (15 downto 0);
signal end_rgt      : std_logic                     := '0';

signal total_area   : std_logic_vector (15 downto 0):= "0000000000000000";
signal tmp_area     : std_logic_vector (15 downto 0):= "0000000000000000";

signal top_address  : std_logic_vector (15 downto 0):= "0000000000000000";
signal bot_address  : std_logic_vector (15 downto 0):= "0000000000000000";
signal lft_address  : std_logic_vector (15 downto 0):= "0000000000000000";
signal rgt_address  : std_logic_vector (15 downto 0):= "0000000000000000";

signal multiply     : std_logic                     := '0';
signal multiplied   : std_logic                     := '0';
begin
    top : comp_top port map(
        i_clk       => i_clk,
        i_start     => start_top,
        i_rst       => i_rst,
        i_data      => i_data,
        
        i_width     => width,
        i_height    => height,
        i_threshold => threshold,
                    
        o_address   => top_address,
                    
        o_end       => end_top,
        o_area      => area_top,
        o_y         => y_top
        );
                
    bot : comp_bot port map(
        i_clk       => i_clk,
        i_start     => start_bot,
        i_rst       => i_rst,
        i_data      => i_data,
        
        o_address   => bot_address,
        
        i_width     => width,
        i_height    => height,
        i_threshold => threshold,
        i_addr_offset   => total_area,
        
        o_end       => end_bot,
        o_area      => area_bot,
        o_y         => y_bot
        );
    lft : comp_lft port map(
        i_clk       => i_clk,
        i_start     => start_lft,
        i_rst       => i_rst,
        i_data      => i_data,
        
        o_address   => lft_address,
        
        i_width     => width,
        i_threshold => threshold,
        i_addr_offset   => std_logic_vector(area_top),
        i_bound_top => y_top,
        i_bound_bot => y_bot,
                    
        o_end       => end_lft,
        o_area      => area_lft
    );
    rgt : comp_rgt port map (
        i_clk       => i_clk,
        i_start     => start_rgt,
        i_rst       => i_rst,
        i_data      => i_data,
        
        o_address   => rgt_address,
        
        i_width     => width,
        i_threshold => threshold,
        i_addr_offset   => std_logic_vector(area_top),
        i_bound_top => y_top,
        i_bound_bot => y_bot,
                    
        o_end       => end_rgt,
        o_area      => area_rgt
    );
    
    -- processo principale adibito alla gestione degli stati finiti della macchina e alla scrittura in memoria del risultato
    Main : process(i_clk)
    begin
        if i_clk'event and i_clk = '0' then
            if i_rst = '1' then
                state       <= S_BEGIN;
                width       <= "00000000";
                height      <= "00000000";
                threshold   <= "00000000";
                o_done      <= '0';
                o_en        <= '0';
                o_we        <= '0';
                start_top   <= '0';
            elsif i_start = '1' and state = S_BEGIN then
                state       <= S_WIDTH;
                o_en        <= '1';
            -- leggo la larghezza
            elsif state = S_WIDTH then
                width       <= i_data;
                state       <= S_HEIGHT;
            -- leggo l'altezza
            elsif state = S_HEIGHT then
                height      <= i_data;
                multiply    <= '1';
                state       <= S_THRESHOLD;
            -- caso particolare: l'immagine ha zero altezza o zero lunghezza, posso gia' mandare in output il risultato
            elsif state = S_THRESHOLD and (unsigned(width) = 0 or unsigned(height) = 0) then
                tmp_area    <= "0000000000000000";
                o_en        <= '1';
                o_we        <= '1';
                o_data      <= "00000000";
                state       <= S_END_0;
            -- leggo la soglia
            elsif state = S_THRESHOLD and not(unsigned(width) = 0 or unsigned(height) = 0) then
                threshold   <= i_data;
                start_top   <= '1';
                state       <= S_WAITING_TOP;
            -- caso particolare: top non ha mai superato la soglia, posso gia' mandare in output il risultato
            elsif state = S_WAITING_TOP and end_top = '1' and std_logic_vector(area_top) = total_area then
                tmp_area    <= "0000000000000000";
                o_en        <= '1';
                o_we        <= '1';
                o_data      <= "00000000";
                state       <= S_END_0;
            -- top ha finito: passo a bot
            elsif state = S_WAITING_TOP and end_top = '1' and not(std_logic_vector(area_top) = total_area) and multiplied = '1' then
                start_bot   <= '1';
                tmp_area    <= std_logic_vector(unsigned(total_area) - area_top);
                state       <= S_WAITING_BOT;
            -- bot ha finito: passo a lft
            elsif state = S_WAITING_BOT and end_bot = '1' then
                start_lft   <= '1';
                tmp_area    <= std_logic_vector(unsigned(tmp_area) - area_bot);
                state       <= S_WAITING_LFT;
             -- lft ha finito: passo a rgt
            elsif state = S_WAITING_LFT and end_lft = '1' then
                start_rgt   <= '1';
                tmp_area    <= std_logic_vector(unsigned(tmp_area) - area_lft);
                state       <= S_WAITING_RGT;
            -- rgt ha finito: sottraggo l'ultima area
            elsif state = S_WAITING_RGT and end_rgt = '1' then
                tmp_area    <= std_logic_vector(unsigned(tmp_area) - area_rgt);
                state       <= S_WAITING_RES;
            -- preparo il primo byte da scrivere in memoria
            elsif state = S_WAITING_RES  then
                o_en        <= '1';
                o_we        <= '1';
                o_data      <= tmp_area(7 downto 0);
                state       <= S_END_0;
            -- preparo il secondo byte da scrivere in memoria
            elsif state = S_END_0 then
                o_en        <= '1';
                o_we        <= '1';
                o_data      <= tmp_area(15 downto 8);
                state       <= S_END_1;
            -- termino la scrittura e segnalo la fine della computazione
            elsif state = S_END_1 then
                o_en        <= '0';
                o_we        <= '0';
                o_done      <= '1';
                state       <= S_END_2;
            elsif state = S_END_2 then
                o_done      <= '0';
            end if;
        end if;
    end process;

    -- multiplexer adibito al calcolo dell'area
    o_address <=    "0000000000000010" when state = S_WIDTH else
                    "0000000000000011" when state = S_HEIGHT else
                    "0000000000000100" when state = S_THRESHOLD else
                    
                    "0000000000000000" when state = S_WAITING_TOP and end_top = '1' and std_logic_vector(area_top) = total_area else
                    bot_address        when state = S_WAITING_TOP and end_top = '1' and not (std_logic_vector(area_top) = total_area) else
                    top_address        when state = S_WAITING_TOP and not(end_top = '1') else
                    
                    lft_address        when state = S_WAITING_BOT and end_bot = '1' else
                    bot_address        when state = S_WAITING_BOT and not(end_bot = '1') else
                    
                    rgt_address        when state = S_WAITING_LFT and end_lft = '1' else
                    lft_address        when state = S_WAITING_LFT and not(end_lft = '1') else
                    
                    "0000000000000000" when state = S_WAITING_RGT and end_rgt = '1' else
                    rgt_address        when state = S_WAITING_RGT and not(end_rgt = '1') else

                    "0000000000000000" when state = S_END_0 else
                    "0000000000000001" when state = S_END_1 else
                    
                    "1111111111111111";

    -- processo adibito al calcolo dell'area totale
    Multiplier : process(multiply)
    begin
        if multiply'event and multiply = '1' and multiplied = '0' then
            total_area  <= std_logic_vector(unsigned(width) * unsigned(height));
            multiplied  <= '1';
        end if;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comp_top is
    port (
        i_clk         : in  std_logic;
        i_start       : in  std_logic;
        i_rst         : in  std_logic;
        i_data        : in  std_logic_vector (7 downto 0); 
        
        o_address     : out std_logic_vector (15 downto 0);
        
        i_width       : in std_logic_vector (7 downto 0);
        i_height      : in std_logic_vector (7 downto 0);
        i_threshold   : in std_logic_vector (7 downto 0);
        
        o_end         : out std_logic;              -- segnala la fine della computazione
        o_area        : out unsigned (15 downto 0); -- restituisce l'area calcolata
        o_y           : out unsigned (7 downto 0)   -- restituisce la riga in cui l'area si ferma
    );
end comp_top;
architecture Behavioral of comp_top is
type top_states is (S_BEGIN, S_COUNT, S_END);
signal state        : top_states                   := S_BEGIN;
signal zero         : unsigned (15 downto 0)       := "0000000000000101"; -- indirizzo di partenza per l'indice assoluto
signal x            : unsigned (7 downto 0)       := "00000000"; -- usata per capire quando abbiamo finito una riga
signal y            : unsigned (7 downto 0)       := "00000000";
signal tmp_address  : unsigned (15 downto 0)       := "0000000000000000"; -- indirizzo assoluto usato per accedere alla RAM 
signal tmp_area     : unsigned (15 downto 0)       := "0000000000000000";
-- tmp_address e tmp_area devono essere presenti poiche' o_address e o_area sono solo segnali di output, e non possono quindi essere usati per effettuare assegnamenti
begin
    process(i_clk)
    begin
        -- clock in discesa
        if i_clk'event and i_clk = '0' then
            -- reset del modulo
            if i_rst = '1' then
                state       <= S_BEGIN;
                zero        <= "0000000000000101";
                x           <= "00000000";
                y           <= "00000000";
                tmp_area    <= "0000000000000000";
                
                o_area      <= "0000000000000000";
                o_end       <= '0';
                o_y         <= "00000000";
            -- avvio del modulo
            elsif i_start = '1' and state = S_BEGIN then
                tmp_address <= zero;
                state       <= S_COUNT;
            -- in caso in cui abbia terminato una riga, passo a quella successiva e aggiorno l'area coperta
            elsif state = S_COUNT and i_width = std_logic_vector(x) then
                x           <= "00000000";
                y           <= y + 1;
                tmp_area    <= tmp_area + unsigned("00000000" & i_width);
                o_area      <= tmp_area + unsigned("00000000" & i_width);
            -- in caso in cui abbia superato l'ultima riga, ho finito
            elsif state = S_COUNT and i_height = std_logic_vector(y) then
                o_end       <= '1';
                o_y         <= y;
                state       <= S_END;
            -- in caso in cui non sia stata superata la soglia, passo alla casella successiva
            elsif state = S_COUNT and not(i_height = std_logic_vector(y)) and i_data < i_threshold then
                tmp_address <= tmp_address + 1;
                o_address   <= std_logic_vector(tmp_address + 1);
                x           <= x + 1;
            -- in caso in cui abbia superato la soglia, ho finito
            elsif state = S_COUNT and not(i_height = std_logic_vector(y)) and i_data >= i_threshold then
                o_end       <= '1';
                o_y         <= y;
                state       <= S_END;
            end if;
        end if;
    end process;
    
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comp_bot is
    port (
        i_clk         : in  std_logic;
        i_start       : in  std_logic;
        i_rst         : in  std_logic;
        i_data        : in  std_logic_vector (7 downto 0); 
        
        o_address     : out std_logic_vector (15 downto 0);
        
        i_width       : in std_logic_vector (7 downto 0);
        i_height      : in std_logic_vector (7 downto 0);
        i_threshold   : in std_logic_vector (7 downto 0);
        i_addr_offset : in std_logic_vector (15 downto 0); -- l'offset e' l'area totale dell'immagine corrente
        
        o_end         : out std_logic;
        o_area        : out unsigned (15 downto 0); -- area bot
        o_y           : out unsigned (7 downto 0)
    );
end comp_bot;
architecture Behavioral of comp_bot is
type bot_states is (S_BEGIN, S_COUNT, S_END);
signal state        : bot_states                   := S_BEGIN;
signal zero         : unsigned (15 downto 0)       := "0000000000000100";
signal x            : unsigned (7 downto 0)       := "00000000"; -- usata per capire quando abbiamo terminato una riga
signal y            : unsigned (7 downto 0)       := "00000000";
signal tmp_address  : unsigned (15 downto 0)       := "0000000000000000";
signal tmp_area     : unsigned (15 downto 0)       := "0000000000000000";
begin
    process(i_clk)
    begin
        -- clock in discesa
        if i_clk'event and i_clk = '0' then
            -- reset del modulo
            if i_rst = '1' then
                state       <= S_BEGIN;
                
                o_area      <= "0000000000000000";
                o_end       <= '0';
                o_y         <= "00000000";
            -- avvio del modulo
            elsif i_start = '1' and state = S_BEGIN then       
                zero        <= "0000000000000100" + unsigned(i_addr_offset) - unsigned(i_width);
                x           <= "00000000";
                y           <= unsigned(i_height);
                tmp_area    <= "0000000000000000";
                            
                tmp_address <= "0000000000000100" + unsigned(i_addr_offset) - unsigned(i_width);
                state       <= S_COUNT;
            -- in caso in cui abbia terminato una riga, passo a quella successiva e aggiorno l'area coperta
            elsif state = S_COUNT and x = unsigned(i_width) then
                x           <= "00000000";
                y           <= y - 1;
                
                tmp_address <= tmp_address - unsigned(i_width) - unsigned(i_width);
                o_address   <= std_logic_vector(tmp_address - unsigned(i_width) - unsigned(i_width));
                                
                tmp_area    <= tmp_area + unsigned("00000000" & i_width);
                o_area      <= tmp_area + unsigned("00000000" & i_width);
            -- in caso in cui non sia stata superata la soglia, passo alla casella successiva
            elsif state = S_COUNT and not(x = unsigned(i_width)) and i_data < i_threshold then
                tmp_address <= tmp_address + 1;
                o_address   <= std_logic_vector(tmp_address + 1);
                x           <= x + 1;
            -- in caso in cui abbia superato la soglia, ho finito
            elsif state = S_COUNT and not(x = unsigned(i_width)) and i_data >= i_threshold then
                o_end       <= '1';
                o_y         <= y;
                state       <= S_END;
            -- il caso in cui abbia superato la prima riga non e' contemplato
            end if;
        end if;
    end process;    
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comp_lft is
    port (
        i_clk         : in  std_logic;
        i_start       : in  std_logic;
        i_rst         : in  std_logic;
        i_data        : in  std_logic_vector (7 downto 0); 
        
        o_address     : out std_logic_vector (15 downto 0);
        
        i_width       : in std_logic_vector (7 downto 0);
        i_threshold   : in std_logic_vector (7 downto 0);
        i_addr_offset : in std_logic_vector (15 downto 0); -- l'offset e' l'area calcolata da top
        i_bound_top   : in unsigned (7 downto 0); -- confine superiore da non superare
        i_bound_bot   : in unsigned (7 downto 0); -- confine inferiore da non superare
        
        o_end         : out std_logic;
        o_area        : out unsigned (15 downto 0)
    );
end comp_lft;
architecture Behavioral of comp_lft is
type lft_states is (S_BEGIN, S_COUNT, S_END);
signal state        : lft_states                   := S_BEGIN;
signal zero         : unsigned (15 downto 0)       := "0000000000000101";
signal y            : unsigned (7 downto 0)        := "00000000";
signal tmp_address  : unsigned (15 downto 0)       := "0000000000000000";
signal tmp_area     : unsigned (15 downto 0)       := "0000000000000000";
signal real_height  : unsigned (7 downto 0)        := "00000000";
begin
    process(i_clk)
    begin
        -- clock in discesa
        if i_clk'event and i_clk = '0' then
            -- reset del modulo
            if i_rst = '1' then
                o_area      <= "0000000000000000";
                o_end       <= '0';
                            
                state       <= S_BEGIN;
            -- avvio del modulo
            elsif i_start = '1' and state = S_BEGIN then
                zero        <= "0000000000000101" + unsigned(i_addr_offset);
                tmp_address <= "0000000000000101" + unsigned(i_addr_offset);
                o_address   <= std_logic_vector("0000000000000101" + unsigned(i_addr_offset));

                y           <= "00000000";
                real_height <= i_bound_bot - i_bound_top;
                
                tmp_area    <= "0000000000000000";
                
                state       <= S_COUNT;
            -- in caso in cui abbia terminato una colonna, passo a quella successiva e aggiorno l'area coperta
            elsif state = S_COUNT and y = real_height then
                zero        <= zero + 1;
                tmp_address <= zero + 1;
                o_address   <= std_logic_vector(zero + 1);
                
                y           <= "00000000";
                
                tmp_area    <=  tmp_area + unsigned("00000000" & real_height);
                o_area      <=  tmp_area + unsigned("00000000" & real_height);
                
                state       <= S_COUNT;
            -- in caso in cui non sia stata superata la soglia, passo alla casella successiva
            elsif state = S_COUNT and not(y = real_height) and i_data < i_threshold then
                tmp_address <= tmp_address + unsigned("00000000" & i_width);
                o_address   <= std_logic_vector(tmp_address + unsigned("00000000" & i_width));
                
                y           <= y + 1;
                
                state       <= S_COUNT;
            -- in caso in cui abbia superato la soglia, ho finito
            elsif state = S_COUNT and not(y = real_height) and i_data >= i_threshold then
                o_end       <= '1';
                state       <= S_END;
            end if;
        end if;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comp_rgt is
    port (
        i_clk         : in  std_logic;
        i_start       : in  std_logic;
        i_rst         : in  std_logic;
        i_data        : in  std_logic_vector (7 downto 0); 
        
        o_address     : out std_logic_vector (15 downto 0);
        
        i_width       : in std_logic_vector (7 downto 0);
        i_threshold   : in std_logic_vector (7 downto 0);
        i_addr_offset : in std_logic_vector (15 downto 0); -- l'offset e' l'area calcolata da top piu' una riga
        i_bound_top   : in unsigned (7 downto 0);
        i_bound_bot   : in unsigned (7 downto 0);
                    
        o_end         : out std_logic;
        o_area        : out unsigned (15 downto 0)
    );
end comp_rgt;
architecture Behavioral of comp_rgt is
type rgt_states is (S_BEGIN, S_COUNT, S_END);
signal state        : rgt_states                   := S_BEGIN;
signal zero         : unsigned (15 downto 0)       := "0000000000000100";
signal y            : unsigned (7 downto 0)        := "00000000";
signal tmp_address  : unsigned (15 downto 0)       := "0000000000000000";
signal tmp_area     : unsigned (15 downto 0)       := "0000000000000000";
signal real_height  : unsigned (7 downto 0)        := "00000000";
begin
    process(i_clk)
    begin
        -- clock in discesa
        if i_clk'event and i_clk = '0' then
            -- reset del modulo
            if i_rst = '1' then
                o_area      <= "0000000000000000";
                o_end       <= '0';
                            
                state       <= S_BEGIN;
            -- avvio del modulo
            elsif i_start = '1' and state = S_BEGIN then
                zero        <= "0000000000000100" + unsigned(i_addr_offset) + unsigned(i_width);
                tmp_address <= "0000000000000100" + unsigned(i_addr_offset) + unsigned(i_width);
                o_address   <= std_logic_vector("0000000000000100" + unsigned(i_addr_offset) + unsigned(i_width));
                
                y           <= "00000000";
                real_height <= i_bound_bot - i_bound_top;
                
                tmp_area    <= "0000000000000000";
                
                state       <= S_COUNT;
            -- in caso in cui abbia terminato una colonna, passo a quella precedente e aggiorno l'area coperta
            elsif state = S_COUNT and y = real_height then
                zero        <= zero - 1;
                tmp_address <= zero - 1;
                o_address   <= std_logic_vector(zero - 1);
                
                y           <= "00000000";
                
                tmp_area    <= tmp_area + unsigned("00000000" & real_height);
                o_area      <= tmp_area + unsigned("00000000" & real_height);
                
                state       <= S_COUNT;
            -- in caso in cui non sia stata superata la soglia, passo alla casella successiva
            elsif state = S_COUNT and not(y = real_height) and i_data < i_threshold then
                tmp_address <= tmp_address + unsigned(i_width);
                o_address   <= std_logic_vector(tmp_address + unsigned(i_width));
                
                y           <= y + 1;
                state       <= S_COUNT;
            -- in caso in cui abbia superato la soglia, ho finito
            elsif state = S_COUNT and not(y = real_height) and i_data >= i_threshold then
                o_end       <= '1';
                state       <= S_END;
            end if;
        end if;
    end process;
end Behavioral;

