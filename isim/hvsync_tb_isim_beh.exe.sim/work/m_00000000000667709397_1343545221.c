/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Donovan/Downloads/VGA manual/vga_demo/hvsync_generator_tb.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_36_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;

LAB0:    t1 = (t0 + 3920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);

LAB4:    t2 = (t0 + 280);
    xsi_vlog_namedbase_setdisablestate(t2, &&LAB5);
    t3 = (t0 + 3728);
    xsi_vlog_namedbase_pushprocess(t2, t3);

LAB6:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 3728);
    xsi_process_wait(t4, 20000LL);
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB5:    t3 = (t0 + 3728);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB2;

LAB7:    xsi_set_current_line(38, ng0);
    t6 = (t0 + 2840);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memset(t5, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t9) == 0)
        goto LAB8;

LAB10:    t15 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t15) = 1;

LAB11:    t16 = (t5 + 4);
    t17 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    *((unsigned int *)t5) = t19;
    *((unsigned int *)t16) = 0;
    if (*((unsigned int *)t17) != 0)
        goto LAB13;

LAB12:    t24 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t24 & 1U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 & 1U);
    t26 = (t0 + 2840);
    xsi_vlogvar_assign_value(t26, t5, 0, 0, 1);
    t2 = (t0 + 280);
    xsi_vlog_namedbase_popprocess(t2);
    goto LAB5;

LAB8:    *((unsigned int *)t5) = 1;
    goto LAB11;

LAB13:    t20 = *((unsigned int *)t5);
    t21 = *((unsigned int *)t17);
    *((unsigned int *)t5) = (t20 | t21);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    *((unsigned int *)t16) = (t22 | t23);
    goto LAB12;

}

static void Initial_42_1(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;

LAB0:    t1 = (t0 + 4168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);

LAB4:    t2 = (t0 + 576);
    xsi_vlog_namedbase_setdisablestate(t2, &&LAB5);
    t3 = (t0 + 3976);
    xsi_vlog_namedbase_pushprocess(t2, t3);

LAB6:    xsi_set_current_line(44, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3000);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);
    xsi_set_current_line(45, ng0);

LAB7:    xsi_set_current_line(46, ng0);

LAB8:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 4736);
    *((int *)t2) = 1;
    t3 = (t0 + 4200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB9;

LAB1:    return;
LAB5:    t3 = (t0 + 3976);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB1;

LAB9:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 3000);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t6, 12, t7, 32);
    t9 = (t0 + 3000);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 12);
    goto LAB7;

LAB10:    t2 = (t0 + 576);
    xsi_vlog_namedbase_popprocess(t2);
    goto LAB5;

}

static void Initial_52_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 4416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);

LAB4:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 4224);
    xsi_process_wait(t2, 45000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

}


extern void work_m_00000000000667709397_1343545221_init()
{
	static char *pe[] = {(void *)Always_36_0,(void *)Initial_42_1,(void *)Initial_52_2};
	xsi_register_didat("work_m_00000000000667709397_1343545221", "isim/hvsync_tb_isim_beh.exe.sim/work/m_00000000000667709397_1343545221.didat");
	xsi_register_executes(pe);
}
