%% Problem 1: Simulering av konfidensintervall
% % Parametrar:
% n = 25; %Antal matningar
% mu = 2; %Vantevardet
% sigma = 1; %Standardavvikelsen
% alpha = 0.05;
% %Simulerar n observationer for varje intervall
% x = normrnd(mu, sigma,n,100); %n x 100 matris med varden
% %Skattar mu med medelvardet
% xbar = mean(x); %vektor med 100 medelvarden.
% %Beraknar de undre och ovre granserna
% undre = xbar - norminv(1-alpha/2)*sigma/sqrt(n);
% ovre = xbar + norminv(1-alpha/2)*sigma/sqrt(n);

%% Problem 1: Simulering av konfidensintervall (forts.)
% %Ritar upp alla intervall
% figure(1)
% hold on
% for k=1:100
% if ovre(k) < mu % Rodmarkerar intervall som missar mu
% plot([undre(k) ovre(k)],[k k],'r')
% elseif undre(k) > mu
% plot([undre(k) ovre(k)],[k k],'r')
% else
% plot([undre(k) ovre(k)],[k k],'b')
% end
% end
% %b1 och b2 ar bara till for att figuren ska se snygg ut.
% b1 = min(xbar - norminv(1 - alpha/2)*sigma/sqrt(n));
% b2 = max(xbar + norminv(1 - alpha/2)*sigma/sqrt(n));
% axis([b1 b2 0 101]) %Tar bort outnyttjat utrymme i figuren
% %Ritar ut det sanna vardet
% plot([mu mu],[0 101],'g')
% hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat
% M = 1e4;
% b = 4;
% x = raylrnd(b, M, 1);
% hist_density(x, 40)
% hold on
% my_est_ml = sqrt(sum(x.^2)/(2*M)); % Skriv in din ML-skattning har
% my_est_mk = sqrt(2/pi)*mean(x); % Skriv in din MK-skattning har
% % plot(my_est_ml, 0, 'r*');
% % plot(my_est_mk, 0, 'g*');
% % plot(b, 0, 'ro');
% % hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat (forts.)
% x_axis = 0:0.1:17; % tillagd för att kunna ändra intervallen
% plot(x_axis, raylpdf(x_axis, my_est_ml), 'r');
% hold off

%% Problem 3: Konfidensintervall for Rayleighfordelning
load wave_data.mat
subplot(2,1,1), plot(y(1:end))
subplot(2,1,2), hist_density(y)

%% My estimate
% Estimate the Rayleigh distribution parameter using the ML method
my_est = sqrt(sum(y.^2)/(2*numel(y)));
% Set the confidence level (e.g., 95%)
conf_level = 0.95;
alpha = 1 - conf_level;
% Calculate the chi-square values
chi2_low = chi2inv(alpha/2, 2*numel(y));
chi2_up = chi2inv(1-alpha/2, 2*numel(y));
% Calculate the bounds of the confidence interval
lower_bound = sqrt(chi2_low/(2*numel(y)));
upper_bound = sqrt(chi2_up/(2*numel(y)));

%% Problem 3: Konfidensintervall (forts.)
hold on % Gor sa att ploten halls kvar
plot(lower_bound, 0, 'g*')
plot(upper_bound, 0, 'g*')

%% Problem 3: Konfidensintervall (forts.)
plot(0:0.1:6, raylpdf(0:0.1:6, my_est), 'r')
hold off

%% Problem 4: Fordelningar av givna data
% load birth.dat
% x = birth(birth(:, 20) < 3, 3);
% y = birth(birth(:, 20) == 3, 3);
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,1), boxplot(x),
% axis([0 2 500 5000])
% subplot(2,2,2), boxplot(y),
% axis([0 2 500 5000])
% 
% %% Problem 4: Fordelningar av givna data (forts.)
% subplot(2,2,3:4), ksdensity(x),
% hold on
% [fy, ty] = ksdensity(y);
% plot(ty, fy, 'r')
% hold off
% 
% %% Problem 6: Regression
% res = w-X*beta_hat;
% subplot(2,1,1), normplot(res)
% subplot(2,1,2), hist(res)