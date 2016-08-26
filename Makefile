all: ujlreq-v.tfm ujlreq-v.vf ubjlreq-v.tfm ubjlreq-v.vf uzjlreq-v.tfm uzjlreq-v.vf ubzjlreq-v.tfm ubzjlreq-v.vf jlreq-v.tfm jlreq-v.vf bjlreq-v.tfm bjlreq-v.vf zjlreq-v.tfm zjlreq-v.vf bzjlreq-v.tfm bzjlreq-v.vf

%v.tfm: %v.pl
	ppltotf $< $@

u%v.tfm: u%v.pl
	uppltotf $< $@

u%v.vf: u%v.tfm
	makejvf -i -u jis $< urmlv.tfm

%v.vf: %v.tfm
	makejvf -i -u jis $< rmlv.tfm

u%-v.pl:  jfm-%v.lua luajfm2pl.lua
	texlua luajfm2pl.lua $*v $@

%-v.pl:  jfm-%v.lua luajfm2pl.lua
	texlua luajfm2pl.lua --noutf $*v $@

jfm-%.lua: make_variant_jfm.lua
	texlua make_variant_jfm.lua

clean:
	rm -f *.tfm *.pl *.vf
	rm -f jfm-bjlreqv.lua jfm-zjlreqv.lua jfm-bzjlreqv.lua
