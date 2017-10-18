function res = init_MARLow_gray(x, S, x0, sig, iter)
par.win = 8;
par.nblk = 64;
par.step = 4;
par.K = iter;
par.mask = S;
par.x_init = x0;
par.nSig = sig;
% The original image is used only for computing PSNR and SSIM
par.ori_im = x;

res = MARLow_gray(par);

