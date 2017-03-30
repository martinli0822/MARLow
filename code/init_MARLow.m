function res = init_MARLow(x, S, x0, sig, iter)
par.win = 5;
par.nblk = 75;    
par.step = 4;
par.K = iter;
par.mask = S;
par.x_init = x0;
par.nSig = sig;

% The original image is used only for computing PSNR and SSIM
% par.ori_im = x;

res = MARLow(par);