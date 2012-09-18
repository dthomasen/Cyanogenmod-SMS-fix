.class public Lcom/android/internal/telephony/SonyQualcommRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SonyQualcommRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/SonyQualcommRIL$1;,
        Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;
    }
.end annotation


# instance fields
.field RILJ_LOGD:Z

.field RILJ_LOGV:Z

.field private final RIL_INT_RADIO_OFF:I

.field private final RIL_INT_RADIO_ON:I

.field private final RIL_INT_RADIO_UNAVALIABLE:I

.field protected mAid:Ljava/lang/String;

.field protected mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

.field protected mIccThread:Landroid/os/HandlerThread;

.field protected mSMSLock:Ljava/lang/Object;

.field protected mIsSendingSMS:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 6
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    const/4 v1, 0x1

    .line 54
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mSMSLock:Ljava/lang/Object;

    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIsSendingSMS:Z

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    .line 46
    iput-boolean v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RILJ_LOGV:Z

    .line 47
    iput-boolean v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RILJ_LOGD:Z

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RIL_INT_RADIO_OFF:I

    .line 50
    iput v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RIL_INT_RADIO_UNAVALIABLE:I

    .line 51
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RIL_INT_RADIO_ON:I

    .line 55
    return-void
.end method

.method private setRadioStateFromRILInt(I)V
    .registers 8
    .parameter "stateCode"

    .prologue
    const/4 v4, 0x0

    .line 357
    sparse-switch p1, :sswitch_data_56

    .line 382
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unrecognized RIL_RadioState: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 359
    :sswitch_1d
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_OFF:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 360
    .local v2, radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    iget-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    if-eqz v3, :cond_27

    .line 361
    iput-object v4, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 362
    iput-object v4, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    .line 385
    :cond_27
    :goto_27
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/SonyQualcommRIL;->switchToRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 386
    return-void

    .line 366
    .end local v2           #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2b
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 367
    .restart local v2       #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_27

    .line 369
    .end local v2           #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2e
    iget-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    if-nez v3, :cond_52

    .line 370
    new-instance v0, Landroid/os/HandlerThread;

    const-string v3, "IccHandler"

    invoke-direct {v0, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 371
    .local v0, handlerThread:Landroid/os/HandlerThread;
    iput-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 373
    iget-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 375
    iget-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    .line 376
    .local v1, looper:Landroid/os/Looper;
    new-instance v3, Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    invoke-direct {v3, p0, p0, v1}, Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;-><init>(Lcom/android/internal/telephony/SonyQualcommRIL;Lcom/android/internal/telephony/RIL;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    .line 377
    iget-object v3, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIccHandler:Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;

    invoke-virtual {v3}, Lcom/android/internal/telephony/SonyQualcommRIL$IccHandler;->run()V

    .line 379
    .end local v0           #handlerThread:Landroid/os/HandlerThread;
    .end local v1           #looper:Landroid/os/Looper;
    :cond_52
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_ON:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 380
    .restart local v2       #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_27

    .line 357
    nop

    :sswitch_data_56
    .sparse-switch
        0x0 -> :sswitch_1d
        0x1 -> :sswitch_2b
        0xa -> :sswitch_2e
    .end sparse-switch
.end method

.method private updateIccType(Lcom/android/internal/telephony/IccCardStatus;)V
    .registers 7
    .parameter "status"

    .prologue
    .line 146
    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCardStatus;->getNumApplications()I

    move-result v2

    if-lez v2, :cond_31

    .line 147
    iget v2, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mPhoneType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_32

    .line 148
    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCardStatus;->getCdmaSubscriptionAppIndex()I

    move-result v0

    .line 152
    .local v0, appType:I
    :goto_f
    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/IccCardStatus;->getApplication(I)Lcom/android/internal/telephony/IccCardApplication;

    move-result-object v1

    .line 153
    .local v1, application:Lcom/android/internal/telephony/IccCardApplication;
    iget-object v2, v1, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    iput-object v2, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    .line 154
    const-string v2, "RILJ"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Picked default AID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .end local v0           #appType:I
    .end local v1           #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_31
    return-void

    .line 150
    :cond_32
    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCardStatus;->getGsmUmtsSubscriptionAppIndex()I

    move-result v0

    .restart local v0       #appType:I
    goto :goto_f
.end method


# virtual methods
.method public changeIccPin(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "oldPin"
    .parameter "newPin"
    .parameter "result"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/SonyQualcommRIL;->changeIccPinForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 72
    return-void
.end method

.method public changeIccPin2(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "oldPin2"
    .parameter "newPin2"
    .parameter "result"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/SonyQualcommRIL;->changeIccPin2ForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 82
    return-void
.end method

.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .registers 8
    .parameter "address"
    .parameter "clirMode"
    .parameter "uusInfo"
    .parameter "result"

    .prologue
    .line 192
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 194
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 195
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 197
    if-nez p3, :cond_4b

    .line 198
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 205
    :goto_18
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 207
    iget-boolean v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->RILJ_LOGD:Z

    if-eqz v1, :cond_47

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SonyQualcommRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SonyQualcommRIL;->riljLog(Ljava/lang/String;)V

    .line 209
    :cond_47
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SonyQualcommRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 210
    return-void

    .line 200
    :cond_4b
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 201
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 202
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 203
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_18
.end method

.method protected getDataCallState(Landroid/os/Parcel;I)Lcom/android/internal/telephony/DataCallState;
    .registers 9
    .parameter "p"
    .parameter "version"

    .prologue
    .line 278
    new-instance v1, Lcom/android/internal/telephony/DataCallState;

    invoke-direct {v1}, Lcom/android/internal/telephony/DataCallState;-><init>()V

    .line 280
    .local v1, dataCall:Lcom/android/internal/telephony/DataCallState;
    iput p2, v1, Lcom/android/internal/telephony/DataCallState;->version:I

    .line 281
    const/4 v4, 0x5

    if-ge p2, v4, :cond_42

    .line 282
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->cid:I

    .line 283
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->active:I

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->type:Ljava/lang/String;

    .line 285
    const/4 v4, 0x4

    if-ge p2, v4, :cond_22

    .line 286
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 288
    :cond_22
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, addresses:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_34

    .line 290
    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->addresses:[Ljava/lang/String;

    .line 293
    :cond_34
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1040026

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    .line 318
    :cond_41
    :goto_41
    return-object v1

    .line 295
    .end local v0           #addresses:Ljava/lang/String;
    :cond_42
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->status:I

    .line 296
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->suggestedRetryTime:I

    .line 297
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->cid:I

    .line 298
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/DataCallState;->active:I

    .line 299
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->type:Ljava/lang/String;

    .line 300
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    .line 301
    iget v4, v1, Lcom/android/internal/telephony/DataCallState;->status:I

    sget-object v5, Lcom/android/internal/telephony/DataConnection$FailCause;->NONE:Lcom/android/internal/telephony/DataConnection$FailCause;

    invoke-virtual {v5}, Lcom/android/internal/telephony/DataConnection$FailCause;->getErrorCode()I

    move-result v5

    if-ne v4, v5, :cond_84

    iget-object v4, v1, Lcom/android/internal/telephony/DataCallState;->ifname:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_84

    iget v4, v1, Lcom/android/internal/telephony/DataCallState;->active:I

    if-eqz v4, :cond_84

    .line 303
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "getDataCallState, no ifname"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 305
    :cond_84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 306
    .restart local v0       #addresses:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_96

    .line 307
    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->addresses:[Ljava/lang/String;

    .line 309
    :cond_96
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 310
    .local v2, dnses:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a8

    .line 311
    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->dnses:[Ljava/lang/String;

    .line 313
    :cond_a8
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 314
    .local v3, gateways:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_41

    .line 315
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/android/internal/telephony/DataCallState;->gateways:[Ljava/lang/String;

    goto :goto_41
.end method

.method public getIMSI(Landroid/os/Message;)V
    .registers 3
    .parameter "result"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->getIMSIForApp(Ljava/lang/String;Landroid/os/Message;)V

    .line 162
    return-void
.end method

.method public iccIO(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 21
    .parameter "command"
    .parameter "fileid"
    .parameter "path"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "data"
    .parameter "pin2"
    .parameter "result"

    .prologue
    .line 61
    iget-object v9, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Lcom/android/internal/telephony/SonyQualcommRIL;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 62
    return-void
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .registers 6
    .parameter "p"

    .prologue
    .line 325
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 326
    .local v0, dataPosition:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 328
    .local v1, response:I
    sparse-switch v1, :sswitch_data_28

    .line 334
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 337
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 349
    :goto_11
    return-void

    .line 329
    :sswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 341
    .local v2, ret:Ljava/lang/Object;
    :goto_16
    packed-switch v1, :pswitch_data_32

    goto :goto_11

    .line 343
    :pswitch_1a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 344
    .local v3, state:I
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/SonyQualcommRIL;->setRadioStateFromRILInt(I)V

    goto :goto_11

    .line 330
    .end local v2           #ret:Ljava/lang/Object;
    .end local v3           #state:I
    :sswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_16

    .line 328
    nop

    :sswitch_data_28
    .sparse-switch
        0x3e8 -> :sswitch_12
        0x40e -> :sswitch_22
    .end sparse-switch

    .line 341
    :pswitch_data_32
    .packed-switch 0x3e8
        :pswitch_1a
    .end packed-switch
.end method

.method public queryFacilityLock(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V
    .registers 11
    .parameter "facility"
    .parameter "password"
    .parameter "serviceClass"
    .parameter "response"

    .prologue
    .line 98
    iget-object v4, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/SonyQualcommRIL;->queryFacilityLockForApp(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/os/Message;)V

    .line 99
    return-void
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 7
    .parameter "p"

    .prologue
    .line 113
    new-instance v3, Lcom/android/internal/telephony/IccCardStatus;

    invoke-direct {v3}, Lcom/android/internal/telephony/IccCardStatus;-><init>()V

    .line 114
    .local v3, status:Lcom/android/internal/telephony/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/IccCardStatus;->setCardState(I)V

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/IccCardStatus;->setUniversalPinState(I)V

    .line 116
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/IccCardStatus;->setGsmUmtsSubscriptionAppIndex(I)V

    .line 117
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/IccCardStatus;->setCdmaSubscriptionAppIndex(I)V

    .line 118
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/IccCardStatus;->setImsSubscriptionAppIndex(I)V

    .line 120
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 122
    .local v2, numApplications:I
    const/16 v4, 0x8

    if-le v2, v4, :cond_32

    .line 123
    const/16 v2, 0x8

    .line 125
    :cond_32
    invoke-virtual {v3, v2}, Lcom/android/internal/telephony/IccCardStatus;->setNumApplications(I)V

    .line 127
    const/4 v1, 0x0

    .local v1, i:I
    :goto_36
    if-ge v1, v2, :cond_87

    .line 128
    new-instance v0, Lcom/android/internal/telephony/IccCardApplication;

    invoke-direct {v0}, Lcom/android/internal/telephony/IccCardApplication;-><init>()V

    .line 129
    .local v0, ca:Lcom/android/internal/telephony/IccCardApplication;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/IccCardApplication;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppType;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    .line 130
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/IccCardApplication;->AppStateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;

    .line 131
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/IccCardApplication;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->perso_substate:Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    .line 132
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->app_label:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v0, Lcom/android/internal/telephony/IccCardApplication;->pin1_replaced:I

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->pin1:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/IccCardApplication;->pin2:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 137
    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/IccCardStatus;->addApplication(Lcom/android/internal/telephony/IccCardApplication;)V

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_36

    .line 140
    .end local v0           #ca:Lcom/android/internal/telephony/IccCardApplication;
    :cond_87
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/SonyQualcommRIL;->updateIccType(Lcom/android/internal/telephony/IccCardStatus;)V

    .line 141
    return-object v3
.end method

.method protected responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 10
    .parameter "p"

    .prologue
    .line 167
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    move-object v2, v3

    check-cast v2, [Ljava/lang/String;

    .line 170
    .local v2, strings:[Ljava/lang/String;
    array-length v3, v2

    rem-int/lit8 v3, v3, 0x5

    if-eqz v3, :cond_2e

    .line 171
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RIL_REQUEST_QUERY_AVAILABLE_NETWORKS: invalid response. Got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " strings, expected multible of 5"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 176
    :cond_2e
    new-instance v1, Ljava/util/ArrayList;

    array-length v3, v2

    div-int/lit8 v3, v3, 0x4

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 178
    .local v1, ret:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/OperatorInfo;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_37
    array-length v3, v2

    if-ge v0, v3, :cond_55

    .line 179
    new-instance v3, Lcom/android/internal/telephony/OperatorInfo;

    add-int/lit8 v4, v0, 0x0

    aget-object v4, v2, v4

    add-int/lit8 v5, v0, 0x1

    aget-object v5, v2, v5

    add-int/lit8 v6, v0, 0x2

    aget-object v6, v2, v6

    add-int/lit8 v7, v0, 0x3

    aget-object v7, v2, v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/android/internal/telephony/OperatorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    add-int/lit8 v0, v0, 0x5

    goto :goto_37

    .line 186
    :cond_55
    return-object v1
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 9
    .parameter "p"

    .prologue
    const/4 v6, -0x1

    .line 251
    const/16 v2, 0xc

    .line 254
    .local v2, numInts:I
    const/4 v1, 0x0

    .line 257
    .local v1, noLte:Z
    new-array v3, v2, [I

    .line 258
    .local v3, response:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_7
    if-ge v0, v2, :cond_36

    .line 259
    if-eqz v1, :cond_2f

    const/4 v4, 0x6

    if-le v0, v4, :cond_2f

    const/16 v4, 0xc

    if-ge v0, v4, :cond_2f

    .line 260
    aput v6, v3, v0

    .line 264
    :goto_14
    const/4 v4, 0x7

    if-ne v0, v4, :cond_20

    aget v4, v3, v0

    const/16 v5, 0x63

    if-ne v4, v5, :cond_20

    .line 265
    aput v6, v3, v0

    .line 266
    const/4 v1, 0x1

    .line 268
    :cond_20
    const/16 v4, 0x8

    if-ne v0, v4, :cond_2c

    if-nez v1, :cond_2c

    .line 269
    aget v4, v3, v0

    mul-int/lit8 v4, v4, -0x1

    aput v4, v3, v0

    .line 258
    :cond_2c
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 262
    :cond_2f
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v3, v0

    goto :goto_14

    .line 273
    :cond_36
    return-object v3
.end method

.method public setFacilityLock(Ljava/lang/String;ZLjava/lang/String;ILandroid/os/Message;)V
    .registers 13
    .parameter "facility"
    .parameter "lockState"
    .parameter "password"
    .parameter "serviceClass"
    .parameter "response"

    .prologue
    .line 105
    iget-object v5, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/SonyQualcommRIL;->setFacilityLockForApp(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;Landroid/os/Message;)V

    .line 106
    return-void
.end method

.method public sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 4
    .parameter "smscPDU"
    .parameter "pdu"
    .parameter "result"

    iget-object v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1

    iget-boolean v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIsSendingSMS:Z
    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mSMSLock:Ljava/lang/Object;
	
	const-wide/16 v2, 30000

	:try_start_a

	invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V

	:try_end_a		
	
	:cond_0
	
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIsSendingSMS:Z
	
	monitor-exit v1

    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
	
	return-void

    :catch_0
    move-exception v0
	
	goto :cond_0

	
.end method


.method protected responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .parameter "p"

    iget-object v1, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1
	
    const/4 v0, 0x0
    iput-boolean v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mIsSendingSMS:Z

    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

	monitor-exit v1
	
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
	
    move-result-object v0	
	
	.local v0, response:Ljava/lang/Object;
	return-object v0

.end method

.method public setNetworkSelectionMode(Ljava/lang/String;Landroid/os/Message;)V
    .registers 6
    .parameter "operatorNumeric"
    .parameter "response"

    .prologue
    .line 216
    if-nez p1, :cond_17

    .line 217
    const/16 v1, 0x2e

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 221
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    :goto_8
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 222
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 224
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SonyQualcommRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 225
    return-void

    .line 219
    .end local v0           #rr:Lcom/android/internal/telephony/RILRequest;
    :cond_17
    const/16 v1, 0x2f

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .restart local v0       #rr:Lcom/android/internal/telephony/RILRequest;
    goto :goto_8
.end method

.method public setNetworkSelectionModeAutomatic(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 230
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->setNetworkSelectionMode(Ljava/lang/String;Landroid/os/Message;)V

    .line 231
    return-void
.end method

.method public setNetworkSelectionModeManual(Ljava/lang/String;Landroid/os/Message;)V
    .registers 3
    .parameter "operatorNumeric"
    .parameter "response"

    .prologue
    .line 236
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/SonyQualcommRIL;->setNetworkSelectionMode(Ljava/lang/String;Landroid/os/Message;)V

    .line 237
    return-void
.end method

.method public supplyIccPin(Ljava/lang/String;Landroid/os/Message;)V
    .registers 4
    .parameter "pin"
    .parameter "result"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/internal/telephony/SonyQualcommRIL;->supplyIccPinForApp(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 67
    return-void
.end method

.method public supplyIccPin2(Ljava/lang/String;Landroid/os/Message;)V
    .registers 4
    .parameter "pin"
    .parameter "result"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/internal/telephony/SonyQualcommRIL;->supplyIccPin2ForApp(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 77
    return-void
.end method

.method public supplyIccPuk(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "puk"
    .parameter "newPin"
    .parameter "result"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/SonyQualcommRIL;->supplyIccPukForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 87
    return-void
.end method

.method public supplyIccPuk2(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "puk2"
    .parameter "newPin2"
    .parameter "result"

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/internal/telephony/SonyQualcommRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/SonyQualcommRIL;->supplyIccPuk2ForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 92
    return-void
.end method

.method protected switchToRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V
    .registers 3
    .parameter "newState"

    .prologue
    .line 242
    invoke-virtual {p1}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/android/internal/telephony/SonyQualcommRIL;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v0

    if-nez v0, :cond_14

    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SonyQualcommRIL;->getVoiceRadioTechnology(Landroid/os/Message;)V

    .line 244
    :cond_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SonyQualcommRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 245
    return-void
.end method
