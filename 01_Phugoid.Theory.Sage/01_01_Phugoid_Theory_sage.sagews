︠d5f1008c-d5f7-4b93-a6fc-7ce45beef10fa︠
%auto
typeset_mode(true)
︡beb73a59-4f67-46d9-97ac-ae63e9f64718︡{"auto":true}︡
︠80b4a62c-57cb-49a1-a41b-569c01c2a336i︠
%md

# 01_01_Phugoid_Theory as SageMathCloud worksheet

Based on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).

Numbers in parentheses are equation numbers in the IPython notebook.
︡ebff28b2-acca-4b8a-bb8c-4d1957ad7193︡{"md":"\n# 01_01_Phugoid_Theory as SageMathCloud worksheet\n\nBased on [numerical-mooc / lessons / 01_phugoid / 01_01_Phugoid_Theory.ipynb](http://nbviewer.ipython.org/github/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) from [MAE6286](http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/about).\n\nNumbers in parentheses are equation numbers in the IPython notebook.\n"}︡
︠bfb06e38-c6ff-4ea0-9a39-63726b4d3af1i︠
%html

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type"><a href="http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/DrXyzzy/assignment-bank" property="cc:attributionName" rel="cc:attributionURL">Hal Snyder</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/numerical-mooc/assignment-bank" rel="dct:source">https://github.com/numerical-mooc/assignment-bank</a>.
︡3bd1e757-d162-47b7-b9d8-309c117eee44︡{"html":"\n<a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by/4.0/80x15.png\" /></a><br /><span xmlns:dct=\"http://purl.org/dc/terms/\" href=\"http://purl.org/dc/dcmitype/InteractiveResource\" property=\"dct:title\" rel=\"dct:type\"><a href=\"http://openedx.seas.gwu.edu/courses/GW/MAE6286/2014_fall/\">MAE6286</a> phugoid flight tutorial transcribed to sage</span> by <a xmlns:cc=\"http://creativecommons.org/ns#\" href=\"https://github.com/DrXyzzy/assignment-bank\" property=\"cc:attributionName\" rel=\"cc:attributionURL\">Hal Snyder</a> is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by/4.0/\">Creative Commons Attribution 4.0 International License</a>.<br />Based on a work at <a xmlns:dct=\"http://purl.org/dc/terms/\" href=\"https://github.com/numerical-mooc/assignment-bank\" rel=\"dct:source\">https://github.com/numerical-mooc/assignment-bank</a>.\n"}︡
︠32ae929c-1d4a-4e43-a89b-1d53292d0be3︠
# (1) equation of lift

# L     lift force
# S     surface area
# rho   density of air
# v     forward velocity
# C_L   coefficient of lift

%var L,S,rho,v, C_L
eq_L = L == C_L * S * (1/2) * rho * v^2
eq_L
︡c6fba2a8-e859-4d15-ae36-aa6fc197317f︡{"tex":{"tex":"L = \\frac{1}{2} \\, C_{L} S \\rho v^{2}","display":true}}︡
︠3cf22e93-3465-4af7-b504-216ba9253844︠
# (2) equation of drag


# D     drag force
# C_D   coefficient of drag

%var D,C_D
eq_D = D == C_D * S * (1/2) * rho * v^2
eq_D
︡7c683e0a-0f24-4794-a154-405ec5e6263d︡{"tex":{"tex":"D = \\frac{1}{2} \\, C_{D} S \\rho v^{2}","display":true}}︡
︠e9267c27-b7e4-4edb-beef-7bef84b30751︠
# (3) equation of force perpendicular to the trajectory

# W     weight of airplane
# theta glide angle

%var W,theta
eq_fprp = L == W * cos(theta)
eq_fprp
︡aa8d9746-0cd4-436d-9906-aa46a736afb8︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right)","display":true}}︡
︠5787cac9-243d-426b-89d5-155e64ebdd67︠
# (3) equation of force parallel to the trajectory

eq_fpar = D == W * sin(theta)
eq_fpar
︡18e605bc-78e0-49d6-887d-7679c467bcef︡{"tex":{"tex":"D = W \\sin\\left(\\theta\\right)","display":true}}︡
︠25e955ff-628a-4b02-afc5-269f546b980e︠
# (4) at trim velocity, lift matches weight

# v_t   trim velocity (when L==W)

%var v_t
eq_L2 = eq_L.subs(v = v_t,L = W)
eq_L2

︡3bb3e4a2-1bc5-4197-9e88-4785d70734df︡{"tex":{"tex":"W = \\frac{1}{2} \\, C_{L} S \\rho v_{t}^{2}","display":true}}︡
︠7f07e7b6-c929-42ab-a456-1f3a4d26ce25︠
# (5) lift ratio as function of flight velocity

eq_lr = eq_L / eq_L2
eq_lr

︡8e82be13-b66c-4ca4-816a-2888c2f8d482︡{"tex":{"tex":"\\frac{L}{W} = \\frac{v^{2}}{v_{t}^{2}}","display":true}}︡
︠a668adb4-f127-4ee1-a3c9-470da274501e︠
# (6) balance centripetal force from curve of plane's path and gravity

# g     acceleration of Earth's gravity
# R     radius of curvature of trajectory

%var g,R

eq_gbal = (L - W * cos(theta) == (W / g) * (v^2 / R)).add_to_both_sides(W * cos(theta))
eq_gbal

︡f11d3de6-75e3-426b-bd32-7688b7735345︡{"tex":{"tex":"L = W \\cos\\left(\\theta\\right) + \\frac{W v^{2}}{R g}","display":true}}︡
︠12297820-6481-49ab-84a2-ec63feb1e5a1︠
# (7) phugoid equation in terms of velocity

eq_phv = (eq_gbal / W).subs_expr(eq_lr).factor().expand().add_to_both_sides(- cos(theta))
eq_phv
︡21a7508c-2f16-46ad-a7f9-d92c5a67d6e3︡{"tex":{"tex":"\\frac{v^{2}}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{v^{2}}{R g}","display":true}}︡
︠fd56fe62-5711-40fc-869c-eca66382e05d︠
# (8) simplify - no friction, lift does no work, total energy is constant
# also set zero energy point at reference horizontal (z == 0)

# z     depth of plane below reference horizontal

%var z,z_t

eq_ze = (1/2) * v^2 - g * z == 0
eq_ze
eq_zt = eq_ze.subs(v = v_t, z = z_t)
eq_zt
︡d7b55476-80e9-4960-8631-602396f2f6f4︡{"tex":{"tex":"\\frac{1}{2} \\, v^{2} - g z = 0","display":true}}︡{"tex":{"tex":"\\frac{1}{2} \\, v_{t}^{2} - g z_{t} = 0","display":true}}︡
︠45262911-1c0c-468d-acf8-148a636d8c41︠
# rearrange z equation

eq_ze2 = eq_ze.solve(v^2)[0]
eq_ze2
︡1feeb7ae-5c93-4d66-be5c-f6e953c5e0a9︡{"tex":{"tex":"v^{2} = 2 \\, g z","display":true}}︡
︠9ba43ce9-7d1f-4432-acbf-977c0ee3573d︠
# rearrange z_t equation

eq_zt2 = eq_zt.solve(v_t^2)[0]
eq_zt2

︡efeba7fa-f630-4970-bbb9-8729775d0b34︡{"tex":{"tex":"v_{t}^{2} = 2 \\, g z_{t}","display":true}}︡
︠d4c4ce68-6b5d-4a96-b22f-07be909e4671︠
# rewrite phugoid equation in terms of z, step 1

eq_p2 = eq_phv.subs_expr(eq_ze2)
eq_p2

︡c5a698ad-e8f9-4c67-b6f6-5a231d1f54b8︡{"tex":{"tex":"\\frac{2 \\, g z}{v_{t}^{2}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠e4d6d896-a770-4324-a824-029833714bb8︠
# (9) rewrite phugoid equation in terms of z, step 2

eq_phz = (eq_p2 * eq_zt2).expand().subs_expr(eq_zt2).multiply_both_sides(1/(2*g*z_t)).expand()
eq_phz


︡c591a727-bb97-4b92-83fe-b8db1aa99a45︡{"tex":{"tex":"\\frac{z}{z_{t}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡
︠560419ef-427c-4fbe-a937-7359a692964b︠
# derivatives - sage notation is preceded by LaTeX version

# (10a) derivative of theta with respect to s, with chain rule

%var s,R
z = function('z')
theta = function('theta')

show('1/R=\\frac{d{\\theta}}{ds}=\\frac{d{\\theta}}{dz}\\frac{dz}{ds}')
eq10a = 1/R == (theta(z(s))).derivative(s)
eq10a

︡8b1fa20e-4ed6-4e8b-9270-335b4ac806c2︡{"tex":{"tex":"1/R=\\frac{d{\\theta}}{ds}=\\frac{d{\\theta}}{dz}\\frac{dz}{ds}","display":true}}︡{"tex":{"tex":"\\frac{1}{R} = D[0]\\left(\\theta\\right)\\left(z\\left(s\\right)\\right) D[0]\\left(z\\right)\\left(s\\right)","display":true}}︡
︠94e3c7e7-46af-4f38-86fe-5dfa934ea983︠
# (10b) derivative of z with respect to s

show('\\frac{dz}{ds}=-sin{\\theta(s)}')
eq10b = z(s).derivative(s) == -sin(theta(s))
eq10b

︡359c2c04-f49c-4148-86ec-ff232f5a15ae︡{"tex":{"tex":"\\frac{dz}{ds}=-sin{\\theta(s)}","display":true}}︡{"tex":{"tex":"D[0]\\left(z\\right)\\left(s\\right) = -\\sin\\left(\\theta\\left(s\\right)\\right)","display":true}}︡
︠8cad6f3e-1c67-4a0c-bcb1-fcd091368144︠
# (11) combine previous two steps for derivative of theta with respect to z

show('1/R=-sin{\\theta}\\frac{d{\\theta}}{dz}')
eq11 = eq10a.subs(eq10b)
eq11

︡02f027ab-c3e3-4206-a4b4-1b8630c6dd3a︡{"tex":{"tex":"1/R=-sin{\\theta}\\frac{d{\\theta}}{dz}","display":true}}︡{"tex":{"tex":"\\frac{1}{R} = -\\sin\\left(\\theta\\left(s\\right)\\right) D[0]\\left(\\theta\\right)\\left(z\\left(s\\right)\\right)","display":true}}︡
︠5e0dac2c-c685-46f3-8400-f95a6ace2ee1︠
# (12) multiply phugoid equation (9) by 1/(2*sqrt(z))

# z and theta are now functions

eq_phz
eq_phzf = eq_phz.subs(z=z(s),theta=theta(z(s)))
eq_phzf
eq_phzf2 = eq_phzf.multiply_both_sides(1/(2*sqrt(z(s)))).simplify_radical().simplify()
eq_phzf2


︡a747da58-f825-4b04-882c-3ae5d1c5f3e7︡{"tex":{"tex":"\\frac{z}{z_{t}} - \\cos\\left(\\theta\\right) = \\frac{2 \\, z}{R}","display":true}}︡{"tex":{"tex":"\\frac{z\\left(s\\right)}{z_{t}} - \\cos\\left(\\theta\\left(z\\left(s\\right)\\right)\\right) = \\frac{2 \\, z\\left(s\\right)}{R}","display":true}}︡{"tex":{"tex":"-\\frac{z_{t} \\cos\\left(\\theta\\left(z\\left(s\\right)\\right)\\right) - z\\left(s\\right)}{2 \\, z_{t} \\sqrt{z\\left(s\\right)}} = \\frac{\\sqrt{z\\left(s\\right)}}{R}","display":true}}︡
︠220542da-9636-4dc4-9515-a94a225d6cc0︠
# (13) substitute for 1/R in (12)

eq_phzf3 = eq_phzf2.expand().add_to_both_sides(cos(theta(z(s)))/(2*sqrt(z(s))))
eq_phzf3
eq_phzf4 = eq_phzf3.subs(eq11)
eq_phzf4

︡745ebb67-3529-46dc-9771-1c0efe6796f2︡{"tex":{"tex":"\\frac{\\sqrt{z\\left(s\\right)}}{2 \\, z_{t}} = \\frac{\\cos\\left(\\theta\\left(z\\left(s\\right)\\right)\\right)}{2 \\, \\sqrt{z\\left(s\\right)}} + \\frac{\\sqrt{z\\left(s\\right)}}{R}","display":true}}︡{"tex":{"tex":"\\frac{\\sqrt{z\\left(s\\right)}}{2 \\, z_{t}} = -\\sin\\left(\\theta\\left(s\\right)\\right) \\sqrt{z\\left(s\\right)} D[0]\\left(\\theta\\right)\\left(z\\left(s\\right)\\right) + \\frac{\\cos\\left(\\theta\\left(z\\left(s\\right)\\right)\\right)}{2 \\, \\sqrt{z\\left(s\\right)}}","display":true}}︡
︠0fa52030-002d-4ba8-b6e1-aa47854ec4dc︠
# text uses "z" for both a variable and a function of s
# we use two symbols for those in Sage
# "zeta" for the variable and "z" for the function of s


%var zeta

eq_phzf5 = eq_phzf4.substitute(z(s)== zeta)
eq_phzf5

︡9bd2324e-f45c-4e1d-bfc1-049dc0e16683︡{"tex":{"tex":"\\frac{\\sqrt{\\zeta}}{2 \\, z_{t}} = -\\sqrt{\\zeta} \\sin\\left(\\theta\\left(s\\right)\\right) D[0]\\left(\\theta\\right)\\left(\\zeta\\right) + \\frac{\\cos\\left(\\theta\\left(\\zeta\\right)\\right)}{2 \\, \\sqrt{\\zeta}}","display":true}}︡
︠57255be0-f647-4246-af4a-2d68a95af7c5︠
# (14) rhs of previous equation (eq_phzf5) is an exact derivative!

h(zeta) = sqrt(zeta) * cos(theta(zeta))
h(zeta)
h.derivative(zeta)

︡60374a54-a7d2-414c-8388-6926f399ccb7︡{"tex":{"tex":"\\sqrt{\\zeta} \\cos\\left(\\theta\\left(\\zeta\\right)\\right)","display":true}}︡{"tex":{"tex":"\\zeta \\ {\\mapsto}\\ -\\sqrt{\\zeta} \\sin\\left(\\theta\\left(\\zeta\\right)\\right) D[0]\\left(\\theta\\right)\\left(\\zeta\\right) + \\frac{\\cos\\left(\\theta\\left(\\zeta\\right)\\right)}{2 \\, \\sqrt{\\zeta}}","display":true}}︡
︠e9368163-f067-40cb-a79a-be2535895908︠









