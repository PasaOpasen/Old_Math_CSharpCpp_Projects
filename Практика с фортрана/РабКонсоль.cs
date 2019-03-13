﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using МатКлассы2018;
using static МатКлассы2018.Number;
using static МатКлассы2018.Vectors;
using static МатКлассы2018.FuncMethods.DefInteg.GaussKronrod;
using System.Windows.Forms;
using Библиотека_графики;

namespace Практика_с_фортрана
{
    public static class РабКонсоль
    {
        public static GrForm GRFORM = new GrForm();

        public static Complex[] Poles; 

        public static bool DINNplay = false;
        public static double epsjump = 1e-1,epsroot=1e-3;

        public static DComplexFunc u,u_, uk1, uk2, uk1_, uk2_,uRes,uResdx,uResdz;
        public static ComplexFunc delta;
        public static RealFunc q;

        public static double c = 1.1, w = 2, c1 = 1, c2 = 2, m1 = 1, m2 = 1;
        public static RealFunc k = (double omega) => omega / c;
        public static RealFunc k1 = (double omega) => omega / c1;
        public static RealFunc k2 = (double omega) => omega / c2;

        public static ComplexFunc sigma = (Complex alp) => Complex.Sqrt((alp - k(w)) * (alp + k(w)));
        
        public static ComplexFunc sigma1 = (Complex a) =>
          {
              double kw = k1(w);
              if (a.Abs > kw) return Complex.Sqrt((a - kw) * (a + kw));
              Complex tmp=Complex.I * Complex.Sqrt((kw - a) * (kw + a));
              if (a.Im * a.Re > 0) return tmp;
              return -tmp;
          };
        public static ComplexFunc sigma2 = (Complex a) =>
        {
            double kw = k2(w);
            if (a.Abs > kw) return Complex.Sqrt((a - kw) * (a + kw));
            Complex tmp = Complex.I * Complex.Sqrt((kw - a) * (kw + a));
            if (a.Im * a.Re > 0) return tmp;
            return -tmp;
        };

        public static ComplexFunc Q;

        public static double a = 1, h = 2, h1 = 1;

        //public static ComplexFunc ChS2H2 = (Complex alp) => { Complex tmp = sigma2(alp); return Complex.Exp(-tmp * h1) + Complex.Exp(tmp * (-2 * h + h1)); };
        //public static ComplexFunc ShS2H2 = (Complex alp) => { Complex tmp = sigma2(alp); return Complex.Exp(-tmp * h1) - Complex.Exp(tmp * (-2 * h + h1)); };
        public static ComplexFunc ChS2H2 = (Complex alp) => Complex.Ch(sigma2(alp) * (h - h1));
        public static ComplexFunc ShS2H2 = (Complex alp) => Complex.Sh(sigma2(alp) * (h - h1));

        public static DoubleComplexFunc K1Up=(Complex alp,Complex z)=>
        {
            Complex s1 = sigma1(alp), s2 = sigma2(alp), tmp1 = m1 * s1 * ChS2H2(alp), tmp2 = m2 * s2 * ShS2H2(alp), sh = Complex.Sh(s1 * (z + h1)), ch = Complex.Ch(s1 * (z + h1));
            return 2 * (tmp1 * ch + tmp2 * sh) / m1 / s1;
        };
        public static DoubleComplexFunc K2Up = (Complex alp, Complex z) =>
        {
            Complex tmp2 = sigma2(alp);
            return 2 * Complex.Ch(tmp2 * (z + h));
        };
        public static DoubleComplexFunc K1Up_ = (Complex alp, Complex z) =>
        {
            Complex s1 = sigma1(alp), s2 = sigma2(alp), tmp1 = m1 * s1 * ChS2H2(alp), tmp2 = m2 * s2 * ShS2H2(alp), sh = Complex.Sh(s1 * (z + h1)), ch = Complex.Ch(s1 * (z + h1));
            return 2 * (tmp1 * sh + tmp2 * ch) / m1;
        };
        public static DoubleComplexFunc K2Up_ = (Complex alp, Complex z) =>
        {
            Complex tmp2 = sigma2(alp);
            return 2 * Complex.Sh(tmp2 * (z + h))*tmp2;
        };

        public static DoubleComplexFunc K1 = (Complex alp, Complex z) => K1Up(alp,z) / delta(alp);      
        public static DoubleComplexFunc K2 = (Complex alp, Complex z) =>K2Up(alp,z) / delta(alp);
        public static DoubleComplexFunc K1_ = (Complex alp, Complex z) => { if (z == 0) return 1.0/m1; return K1Up_(alp, z) / delta(alp); };
        public static DoubleComplexFunc K2_ = (Complex alp, Complex z) => K2Up_(alp, z) / delta(alp);

        private static double t11 = 0, t44 = 15;
        public static double t1
        {
            get
            {
                if (t11 < 0) t11 = Math.Min(k1(w), k2(w)) / 2;
                return t11;
            }
            set
            {
                t11 = value;
            }
        }
        public static double t4
        {
            get
            {
                if (t44 < 0) t44 = Math.Max(k1(w), k2(w))*2;
                return t44;
            }
            set
            {
                t44 = value;
            }
            }

        public static double /*t1=0,*/ t2=t1, t3=t1, /*t4=15,*/ tm=0.2, tp=0, eps=1e-8, pr=1e-2, gr=1e4;

        public static DoubleComplexFunc U_,U;

        [STAThread]
        public static void Main(string[] args)
        {
            FuncMethods.DefInteg.Residue.eps = eps;

            q = (double x) =>
              {
                  if (x.Abs() < a) return 1;
                  return 0;
              };

            Q=(Complex al)=>{ Complex tmp = a * al; return 2*Complex.Sin(tmp) / al; };

            delta = (Complex al) =>
            {
                Complex s1 = sigma1(al),s2=sigma2(al),e=Complex.Exp(s1*h1);
                double h2 = h - h1;
                Complex sh = m2 * sigma2(al) * Complex.Sh(s2*h2), ch = m1 * s1*Complex.Ch(s2*h2);//если ставить косинус от s1h2 и убрать из ch умножение на s1, то похоже на правду
                return e*(ch+sh)+(sh-ch)/e;
            };

             U=(Complex al,Complex z)=>
            {
                Complex s = Q(al);
                if (z.Re > -h1) return K1(al, z) * s;
                else return K2(al, z) * s;
            };
            U_ = (Complex al, Complex z) =>
              {
                  Complex s = Q(al);
                  if (z.Re > -h1) return K1_(al, z) * s;
                  else return K2_(al, z) * s;
              };

            u = (double x, double z) =>
              {
                  ComplexFunc Tmp = (Complex s) => U(s, z);
                  ComplexFunc f = (Complex q) =>
                  {
                      ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                      return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe,t1,t2,t3,t4,tm,tp,eps,pr,gr);
                  };
                  return f(x);
              };
            u_ = (double x, double z) =>
            {
                ComplexFunc Tmp = (Complex s) => U_(s, z);
                ComplexFunc f = (Complex q) =>
                {
                    ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                    return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe, t1, t2, t3, t4, tm, tp, eps, pr, gr);
                };
                return f(x);
            };

            uRes = (double x, double z) =>
              {
                  ComplexFunc K,QE=(Complex s)=>Q(s)*Complex.Exp(-Complex.I*s*x);
                  if (z > -h1) K = (Complex s) => K1Up(s, z);
                  else K = (Complex s) => K2Up(s, z);

                  if (x <= 0) return Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Poles);
                  else return -Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Complex.Minus(Poles));
              };
            uResdx = (double x, double z) =>
            {
                ComplexFunc K, QE = (Complex s) => (-Complex.I*s)*Q(s) * Complex.Exp(-Complex.I * s * x);
                if (z > -h1) K = (Complex s) => K1Up(s, z);
                else K = (Complex s) => K2Up(s, z);

                if (x <= 0) return Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Poles);
                else return -Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Complex.Minus(Poles));
            };
            uResdz = (double x, double z) =>
            {
                ComplexFunc K, QE = (Complex s) => Q(s) * Complex.Exp(-Complex.I * s * x);
                //if (z == 0) K = (Complex s) => delta(s) / m1;
                if (z > -h1) K = (Complex s) => K1Up_(s, z);
                else K = (Complex s) => K2Up_(s, z);

                if (x <= 0) return Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Poles);
                else return -Complex.I * FuncMethods.DefInteg.Residue.ResSum(K, delta, QE, Complex.Minus(Poles));
            };

            uk1 = (double x, double z) =>
            {
                ComplexFunc Tmp = (Complex s) => K1(s, z)*Q(s);
                ComplexFunc f = (Complex q) =>
                {
                    ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                    return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe, t1, t2, t3, t4, tm, tp, eps, pr, gr);
                };
                return f(x);
            };
            uk2 = (double x, double z) =>
            {
                ComplexFunc Tmp = (Complex s) => K2(s, z) * Q(s);
                ComplexFunc f = (Complex q) =>
                {
                    ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                    return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe, t1, t2, t3, t4, tm, tp, eps, pr, gr);
                };
                return f(x);
            };
            uk1_ = (double x, double z) =>
            {
                ComplexFunc Tmp = (Complex s) => K1_(s, z) * Q(s);
                ComplexFunc f = (Complex q) =>
                {
                    ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                    return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe, t1, t2, t3, t4, tm, tp, eps, pr, gr);
                };
                return f(x);
            };
            uk2_ = (double x, double z) =>
            {
                ComplexFunc Tmp = (Complex s) => K2_(s, z) * Q(s);
                ComplexFunc f = (Complex q) =>
                {
                    ComplexFunc fe = (Complex w) => Tmp(w) * Complex.Ch(-Complex.I * q.Re * w);
                    return 1.0 / Math.PI * FuncMethods.DefInteg.GaussKronrod.DINN_GK(fe, t1, t2, t3, t4, tm, tp, eps, pr, gr);
                };
                return f(x);
            };

            //$"{m1 * uk1_(16, 0)} = {q(11)}".Show();

            new OpenForm().ShowDialog();
        }

        public static double steproot = 1e-3,polesBeg=0.01,polesEnd=15;
        public static int countroot = 50;
        public static void SetPoles(double beg = 0.01, double end = 15, double step = 1e-3, double eps = 1e-4, int count = 50)
        {
            РабКонсоль.Poles = ((Complex[])FuncMethods.Optimization.Halfc(РабКонсоль.delta, beg, end, step, eps, count))/*.Where(c=>c!=0).ToArray()*/;
            List<Complex> value = new List<Complex>(), newmas = new List<Complex>();

            double wtf = РабКонсоль.delta(РабКонсоль.Poles[0]).Abs;
            if (wtf < 1e-3)
                newmas.Add(РабКонсоль.Poles[0]);
            for (int j = 1; j < РабКонсоль.Poles.Length; j++)
                newmas.Add(РабКонсоль.Poles[j]);
            РабКонсоль.Poles = newmas.ToArray();
        }
        public static void SetPolesDef() => SetPoles(РабКонсоль.polesBeg, РабКонсоль.polesEnd, РабКонсоль.steproot, РабКонсоль.epsroot, РабКонсоль.countroot);
    }
}
