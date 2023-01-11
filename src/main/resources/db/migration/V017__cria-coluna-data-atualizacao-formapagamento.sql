alter table forma_pagamento add column "data_atualizacao" TIMESTAMP(0) null;
update forma_pagamento set data_atualizacao = CURRENT_TIMESTAMP::timestamptz;
alter table forma_pagamento alter column data_atualizacao set not null;